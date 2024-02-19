// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'providers/providers_logger.dart';
import 'router/app_router.dart';
import 'services/device_info/device_info_service.dart';
import 'theme/theme.dart';

/// Function first called when running the project
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // To load the .env file contents into dotenv
  // await dotenv.load();

  /// Removes hash from the Web routes
  // usePathUrlStrategy();

  /// Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  /// Initialize Hive
// await Hive.initFlutter();
// final hiveStorageService = HiveStorageService();
// await hiveStorageService.openBox('app');

  final deviceInfoService = DeviceInfoService();
  await deviceInfoService.initProperInfo();

  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [ProvidersLogger()],
      /*  overrides: [
        //storageServiceProvider.overrideWithValue(hiveStorageService),
       // deviceInfoServiceProvider.overrideWithValue(deviceInfoService),
      ], */
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ba')],
        path: 'assets/translations',
        useOnlyLangCode: true,
        fallbackLocale: const Locale('en'),
        child: const App(),
      ),
    ),
  );
}

/// Starting point of our Flutter application
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ScreenUtilInit(
        /// Size of the device the designer uses in their designs on Figma
        designSize: const Size(412, 732),
        builder: (_, __) => Consumer(
          builder: (context, ref, child) => MaterialApp.router(
              onGenerateTitle: (_) => 'appName'.tr(),
              debugShowCheckedModeBanner: false,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              theme: AppThemes.primary(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale //ref.watch(localeProvider).toLocale(),
              ),
        ),
      ),
    );
  }
}
