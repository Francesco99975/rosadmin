import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/main.dart';
import 'package:rosadmin/screens/categories.dart';
import 'package:rosadmin/screens/products/products.dart';

class MainDrawer extends StatelessWidget {
  final String active;
  const MainDrawer({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Dashboard Menu',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
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
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);
            },
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
            title: const Text('Customers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
