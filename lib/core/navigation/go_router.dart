import 'package:cat_breeds_app/core/navigation/routes.dart';
import 'package:cat_breeds_app/features/home/cat_breed_details/presentation/cat_breed_details_screen.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/presentation/home_screen.dart';
import 'package:cat_breeds_app/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Provider function to create a [GoRouter] instance for handling navigation in the app.
final goRouterProvider = Provider<GoRouter>((_) => GoRouterHelper().router);

class GoRouterHelper {
  static final GoRouterHelper _instance = GoRouterHelper._internal();

  factory GoRouterHelper() => _instance;

  late final GoRouter router;

  GoRouterHelper._internal() {
    var routes = [
      GoRoute(
        path: Routes.rootRoute.path,
        name: Routes.rootRoute.name,
        pageBuilder: (_, state) {
          return _getPage(
            child: const SplashScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        pageBuilder: (_, state) {
          return _getPage(
            child: const HomeScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: Routes.details.path,
        name: Routes.details.name,
        pageBuilder: (_, state) {
          final id = state.pathParameters['id'] ?? '';
          final catBreed = state.extra as CatBreedModel;
          return _getPage(
            child: CatBreedDetailsScreen(breedId: id, catBreed: catBreed),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.rootRoute.path,
      routes: routes,
    );
  }

  Page _getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
