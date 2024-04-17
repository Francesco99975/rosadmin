import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:option_result/option.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/theme_provider.dart';
import 'package:rosadmin/providers/user.dart';

void main() {
  runApp(const ProviderScope(child: Rosadmin()));
}

class Rosadmin extends ConsumerWidget {
  const Rosadmin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themexProvider);
    return MaterialApp(
      title: 'Rosadmin',
      theme: theme.current,
      home: const SplashView(),
    );
  }
}

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

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
    final user = ref.watch(userxProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: switch (user) {
          AsyncData<Option<User>>() => throw UnimplementedError(),
          AsyncError<Option<User>>() => throw UnimplementedError(),
          AsyncLoading<Option<User>>() => throw UnimplementedError(),
          // TODO: Handle this case.
          AsyncValue<Option<User>>() => throw UnimplementedError(),
        });
  }
}
