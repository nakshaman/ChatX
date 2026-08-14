import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function() onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        child: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}