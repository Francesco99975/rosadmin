import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/screens/categories.dart';
import 'package:rosadmin/screens/dashboard/dashboard.dart';

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
              color: active == DashboardScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Dashboard'),
            onTap: () => context.go(DashboardScreen.routePath),
          ),
          ListTile(
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Products'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.category_outlined,
              color: active == DashboardScreen.routePath
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            title: const Text('Categories'),
            onTap: () => context.go(CategoryScreen.routePath),
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
