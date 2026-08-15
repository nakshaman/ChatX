import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  final Widget child;
  const ShadowBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 15.0,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 4.0,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
