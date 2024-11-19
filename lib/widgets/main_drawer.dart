import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/main.dart';
import 'package:rosadmin/screens/categories.dart';
import 'package:rosadmin/screens/costumers/customers.dart';
import 'package:rosadmin/screens/orders/orders.dart';
import 'package:rosadmin/screens/products/products.dart';
import 'package:rosadmin/screens/settings.dart';

class MainDrawer extends StatelessWidget {
  final String active;
  const MainDrawer({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                // Spacer
                SizedBox(height: 10),
                // App Name
                Text(
                  'Rosadmin', // Replace with your app's name
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard_outlined,
              color: active == SplashView.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Dashboard'),
            onTap: () => context.go(SplashView.routePath),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_bag_outlined,
              color: active == OrderScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Orders'),
            onTap: () => context.go(OrderScreen.routePath),
          ),
          ListTile(
            leading: Icon(
              Icons.category_outlined,
              color: active == CategoryScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Categories'),
            onTap: () => context.go(CategoryScreen.routePath),
          ),
          ListTile(
            leading: Icon(
              Icons.store,
              color: active == ProductScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text("Products"),
            onTap: () => context.go(ProductScreen.routePath),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: active == CustomerScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Customers'),
            onTap: () => context.go(CustomerScreen.routePath),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: active == SettingsScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Settings'),
            onTap: () => context.go(SettingsScreen.routePath),
          ),
        ],
      ),
    );
  }
}
