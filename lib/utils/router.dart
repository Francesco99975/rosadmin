import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/main.dart';
import 'package:rosadmin/screens/categories.dart';
import 'package:rosadmin/screens/products/product_form.dart';
import 'package:rosadmin/screens/products/products.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashView.routePath,
  routes: [
    GoRoute(
      path: SplashView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    // GoRoute(
    //   path: DashboardScreen.routePath,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const DashboardScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AuthScreen.routePath,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const AuthScreen();
    //   },
    // ),
    GoRoute(
        path: CategoryScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryScreen();
        }),
    GoRoute(
        path: ProductScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const ProductScreen();
        }),
    GoRoute(
      path: ProductFormScreen.routePath,
      name: "new",
      builder: (BuildContext context, GoRouterState state) {
        return const ProductFormScreen();
      },
    )
  ],
);
