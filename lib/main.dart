import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/theme_provider.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/screens/dashboard/dashboard.dart';
import 'package:rosadmin/services/gotify_websocket_server.dart';
import 'package:rosadmin/services/notification_service.dart';
import 'package:rosadmin/utils/router.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  // Initialize port for communication between TaskHandler and UI.
  FlutterForegroundTask.initCommunicationPort();

  await NotificationService.init();

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

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routePath = "/";

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
    return AsyncProviderWrapper<User>(
      provider: userxProvider,
      future: userxProvider.future,
      errorOverride: const fp.Option.of(AuthScreen()),
      render: (user) {
        final network = ref.read(networkProvider);
        network.match((_) {}, (network) {
          startCallback(network).then((result) => result.match(
              (l) => debugPrint(l.message),
              (_) => debugPrint("Foreground Service started")));
        });
        return const DashboardScreen();
      },
    );
  }
}
