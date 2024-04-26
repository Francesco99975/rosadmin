import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

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
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the dashboard page
            },
          ),
          ListTile(
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the analytics page
            },
          ),
          ListTile(
            title: const Text('Products'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the settings page
            },
          ),
          ListTile(
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the settings page
            },
          ),
          ListTile(
            title: const Text('Customers'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the settings page
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the settings page
            },
          ),
        ],
      ),
    );
  }
}
