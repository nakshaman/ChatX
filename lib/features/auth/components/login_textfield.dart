import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isObsecureText;
  const LoginTextfield({
    super.key,
    required this.labelText,
    required this.controller,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          obscureText: isObsecureText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
