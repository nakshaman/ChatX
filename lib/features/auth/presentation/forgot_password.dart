import 'package:chatx/features/auth/components/login_button.dart';
import 'package:chatx/features/auth/components/login_textfield.dart';
import 'package:chatx/features/auth/components/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // menu
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const SizedBox(
                      height: 60,
                      width: 60,
                      child: ShadowBox(
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    'F O R G O T  P A S S W O R D',
                    style: GoogleFonts.ubuntu(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
              LoginTextfield(labelText: 'Email', controller: _emailController),
              LoginButton(
                onTap: () {},
                buttonText: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
