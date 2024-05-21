import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/theme_provider.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/screens/dashboard/dashboard.dart';
import 'package:rosadmin/utils/router.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';

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
    final theme = ref.watch(themexProvider);
    return MaterialApp.router(
      title: 'Rosadmin',
      theme: theme.current,
      routerConfig: router,
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routePath = "/";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncProviderWrapper<User>(
      provider: userxProvider,
      future: userxProvider.future,
      errorOverride: const fp.Option.of(AuthScreen()),
      render: (user) => const DashboardScreen(),
    );
  }
}
