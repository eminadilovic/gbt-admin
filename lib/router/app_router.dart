import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/pages/auth_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/registration/presentation/pages/overview_images_page.dart';
import '../features/registration/presentation/pages/profile_image_page.dart';
import '../features/registration/presentation/pages/registration_details_page.dart';
import '../features/splash/pages/splash_page.dart';
import '../services/auth/auth_provider.dart';
import '../services/auth/model/auth_result.dart';
import '../utils/not_found_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: RoutePaths.auth,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const NotFoundPage(),
    routes: [
      GoRoute(
          path: RoutePaths.auth,
          name: RouteNames.auth,
          builder: (context, state) => AuthPage(
                key: state.pageKey,
              ),
          routes: [
            GoRoute(
                path: RoutePaths.login,
                name: RouteNames.login,
                builder: (context, state) {
                  final isRegistration = (state.extra ?? false) as bool;
                  return LoginPage(
                    isRegistration: isRegistration,
                    key: state.pageKey,
                  );
                }),
            GoRoute(
                path: RoutePaths.registrationDetails,
                name: RouteNames.registrationDetails,
                builder: (context, state) => RegistrationDetailsPage(
                      key: state.pageKey,
                    ),
                routes: [
                  GoRoute(
                      path: RoutePaths.profileImagePicker,
                      name: RouteNames.profileImagePicker,
                      builder: (context, state) => ProfileImagePicker(
                            key: state.pageKey,
                          ),
                      routes: [
                        GoRoute(
                            path: RoutePaths.overviewImagesPicker,
                            name: RouteNames.overviewImagesPicker,
                            builder: (context, state) => OverviewImagesPicker(
                                  key: state.pageKey,
                                )),
                      ]),
                ]),
          ]),
      GoRoute(
        path: RoutePaths.home,
        name: RouteNames.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: RoutePaths.splashPage,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      /*      GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            builder: (context, state) => HomePage(
              key: state.pageKey,
            ),
            routes: [
              GoRoute(
                path: '${RoutePaths.detail}/:id',
                name: RouteNames.detail,
                builder: (context, state) {
                  final movie = state.extra as Movie?;

                  return DetailPage(
                    args: DetailPageArgs(
                      id: state.pathParameters['id'],
                      movie: movie,
                    ),
                  );
                },
              ),
            ],
          ), */
    ],
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (authState.isLoading || authState.result != AuthResult.success) return null;

      // Here we guarantee that hasData == true, i.e. we have a readable value

      // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      // Returning `null` means "we are not authorized"
      final isAuth = authState.result != null;

      final isSplash = state.uri.toString() == RoutePaths.splashPage;
      if (isSplash) {
        return isAuth ? RoutePaths.home : RoutePaths.auth;
      }

      final isLoggingIn = state.uri.toString() == RoutePaths.auth;
      if (isLoggingIn) return isAuth ? RoutePaths.home : null;

      return isAuth ? null : RoutePaths.splashPage;
    },
  );
});
