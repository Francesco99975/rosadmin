import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/theme_provider.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:option_result/option.dart' as rs;
import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/screens/dashboard/dashboard.dart';
import 'package:rosadmin/utils/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: Rosadmin()));
}

class Rosadmin extends ConsumerWidget {
  const Rosadmin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themexProvider);
    return MaterialApp.router(
      title: 'Rosadmin',
      theme: theme.current,
      routerConfig: router,
    );
  }
}

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routePath = "/splash";

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userx = ref.watch(userxProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: switch (userx.value) {
          rs.Some<User>() => const DashboardScreen(),
          rs.None<User>() => const AuthScreen(),
          null => const Center(
              child: Text("Error"),
            ),
        });
  }
}
