import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/screens/auth.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userx = ref.read(userxProvider.notifier);
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            userx.logout().then((value) =>
                {if (context.mounted) context.go(AuthScreen.routePath)});
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
