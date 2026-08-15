import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextfield extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  const LoginTextfield({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  late bool isObsecureText;
  @override
  void initState() {
    isObsecureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.ubuntu(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          obscureText: isObsecureText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    onPressed: () {
                      setState(() {
                        isObsecureText = !isObsecureText;
                      });
                    },
                    icon: Icon(
                      isObsecureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )
                : null,
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
