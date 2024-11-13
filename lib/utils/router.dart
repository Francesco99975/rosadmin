import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/main.dart';
import 'package:rosadmin/models/customer.dart';
import 'package:rosadmin/screens/categories.dart';
import 'package:rosadmin/screens/costumers/costimer_detail.dart';
import 'package:rosadmin/screens/costumers/customers.dart';
import 'package:rosadmin/screens/orders/orders.dart';
import 'package:rosadmin/screens/orders/orders_detail.dart';
import 'package:rosadmin/screens/products/product_detail.dart';
import 'package:rosadmin/screens/products/product_form.dart';
import 'package:rosadmin/screens/products/products.dart';
import 'package:rosadmin/screens/scanner.dart';

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
      name: "form_product",
      builder: (BuildContext context, GoRouterState state) {
        return ProductFormScreen(
          pid: state.uri.queryParameters['pid'],
          name: state.uri.queryParameters['name'],
          category: state.uri.queryParameters['category'],
          description: state.uri.queryParameters['description'],
          imageUrl: state.uri.queryParameters['imageUrl'],
          price: double.parse(state.uri.queryParameters['price'] ?? "0.0"),
          published:
              bool.parse(state.uri.queryParameters['published'] ?? "false"),
          featured:
              bool.parse(state.uri.queryParameters['featured'] ?? "false"),
          weighed: bool.parse(state.uri.queryParameters['weighed'] ?? "false"),
        );
      },
    ),
    GoRoute(
      path: ProductDetailScreen.routePath,
      name: "product_detail",
      builder: (BuildContext context, GoRouterState state) {
        return ProductDetailScreen(
          name: state.uri.queryParameters['name'] ?? "",
          category: state.uri.queryParameters['category'] ?? "",
          description: state.uri.queryParameters['description'] ?? "",
          imageUrl: state.uri.queryParameters['imageUrl'] ?? "",
          price: double.parse(state.uri.queryParameters['price'] ?? "0.0"),
          weighed: bool.parse(state.uri.queryParameters['weighed'] ?? "false"),
        );
      },
    ),
    GoRoute(
        path: CustomerScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const CustomerScreen();
        }),
    GoRoute(
      path: CustomerDetailsScreen.routePath,
      name: "costumer_detail",
      builder: (BuildContext context, GoRouterState state) {
        return CustomerDetailsScreen(
          customer: Customer.fromJson(
            state.uri.queryParameters['customer'] ?? "{}",
          ),
        );
      },
    ),
    GoRoute(
        path: OrderScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderScreen();
        }),
    GoRoute(
        path: QRScannerScreen.routePath,
        name: QRScannerScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return QRScannerScreen(
            currentOrderId: state.uri.queryParameters['orderId'] ?? "",
          );
        }),
    GoRoute(
      path: OrderDetailsScreen.routePath,
      name: "order_detail",
      builder: (BuildContext context, GoRouterState state) {
        return OrderDetailsScreen(
          orderId: state.uri.queryParameters['orderId'] ?? "",
        );
      },
    ),
  ],
);
