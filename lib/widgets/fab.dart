import 'package:flutter/material.dart';

class DisabledFAB extends StatelessWidget {
  final String tooltip;
  final IconData icon;

  const DisabledFAB({super.key, required this.tooltip, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      tooltip: tooltip,
      backgroundColor:
          Colors.grey, // Change color to visually indicate disabled state
      child: Icon(icon),
    );
  }
}

class LoadingFAB extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final bool isLoading;

  const LoadingFAB({
    super.key,
    required this.tooltip,
    required this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: isLoading ? null : () {}, // Disable onPressed while loading
      tooltip: tooltip,
      child: isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Icon(icon),
    );
  }
}
