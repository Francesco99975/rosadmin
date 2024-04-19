import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/screens/auth.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const routePath = "/dashboard";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userx = ref.read(userxProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              userx
                  .logout()
                  .then((value) => {context.go(AuthScreen.routePath)});
            },
          ),
        ],
      ),
      drawer: Drawer(
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
              title: const Text('Analytics'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the analytics page
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
      ),
      body: const Center(
        child: Text('Welcome to the Admin Dashboard'),
      ),
    );
  }
}
