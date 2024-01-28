import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/pages/cart_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/pages/catalog_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/pages/categories_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/pages/home_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/liked/pages/liked_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/main_wrapper.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/pages/user_page.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String init = '/home';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorCart =
      GlobalKey<NavigatorState>(debugLabel: 'shellCart');
  static final _rootNavigatorLiked =
      GlobalKey<NavigatorState>(debugLabel: 'shellLiked');
  static final _rootNavigatorUser =
      GlobalKey<NavigatorState>(debugLabel: 'shellUser');

  // Go Router Navigation
  static final GoRouter router = GoRouter(
    initialLocation: init,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Main Wrapper Route
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: [
          // Branch Home
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: ':nameRoom',
                    name: 'categories',
                    builder: (context, state) {
                      return CategoriesPage(
                        key: state.pageKey,
                        idRoom: state.uri.queryParameters['idRoom']!,
                        nameRoom: state.pathParameters['nameRoom']!,
                      );
                    },
                    routes: [
                      GoRoute(
                          path: ':nameCategory',
                          name: 'catalog',
                          builder: (context, state) {
                            return CatalogPage(
                              key: state.pageKey,
                              idCategory:
                                  state.uri.queryParameters['idCategory']!,
                              nameCategory:
                                  state.pathParameters['nameCategory']!,
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Branch Cart
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCart,
            routes: [
              GoRoute(
                path: '/cart',
                name: 'Cart',
                builder: (context, state) => CartPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),

          // Branch Liked
          StatefulShellBranch(
            navigatorKey: _rootNavigatorLiked,
            routes: [
              GoRoute(
                path: '/liked',
                name: 'Liked',
                builder: (context, state) => LikedPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),

          // Branch User
          StatefulShellBranch(
            navigatorKey: _rootNavigatorUser,
            routes: [
              GoRoute(
                path: '/user',
                name: 'User',
                builder: (context, state) => UserPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
