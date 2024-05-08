import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/screens/error.dart';
import 'package:rosadmin/screens/loading.dart';

class AsyncProviderWrapper<T> extends StatelessWidget {
  final AsyncValue<Either<Failure, T>> state;
  final Function onRetry;
  final Widget Function(T) render;

  const AsyncProviderWrapper(
      {super.key,
      required this.state,
      required this.onRetry,
      required this.render});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      AsyncData(:final value) => value.match(
          (l) => ErrorScreen(
              errorMessage: "server error: ${l.message}", onRetry: onRetry),
          render),
      AsyncError(:final error) => ErrorScreen(
          errorMessage: "runtime error: $error",
          onRetry: onRetry,
        ),
      _ => const LoadingScreen()
    };
  }
}
