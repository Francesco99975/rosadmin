import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/auth.dart';
import 'package:rosadmin/providers/user.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  static const routePath = "/auth";

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  FutureEither<void> _login() async {
    loading = true;

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    final network = ref.read(networkProvider);
    final userx = ref.read(userxProvider.notifier);
    var response = await AuthRepo.login(email, password, network);

    final _ = switch (response) {
      Left(value: final l) => {
          if (mounted)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(l.message),
              duration: const Duration(seconds: 5),
            ))
        },
      Right(value: final data) => {
          await userx.setUser(
              User(
                  id: data.user.id,
                  username: data.user.username,
                  email: data.user.email,
                  role: data.user.role,
                  token: data.token),
              data.otp)
        },
    };
    loading = false;
    return const Right(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async => await _login(),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
    );
  }
}
