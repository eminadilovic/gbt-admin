import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/pages/auth_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/registration/registration_details_page.dart';
import '../utils/not_found_page.dart';
import 'route_names.dart';
import 'route_paths.dart';

class AppRouter {
  AppRouter(WidgetRef ref) {
    appRouter = _getAppRouter(ref);
  }

  /// Use this for testing to change the initial
  /// location and quickly access some page
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  late GoRouter appRouter;
  static String initialLocation = RoutePaths.auth;

  GoRouter _getAppRouter(WidgetRef ref) => GoRouter(
        initialLocation: initialLocation,
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
                        )),
              ]),
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
      );
}
