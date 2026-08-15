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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        // 1. Top Navigation Bar
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const SizedBox(
                                height: 60,
                                width: 60,
                                child: ShadowBox(
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'F O R G O T  P A S S W O R D',
                                  style: GoogleFonts.ubuntu(
                                    color: colorScheme.inversePrimary,
                                    letterSpacing: 1.2,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            // Matches the back button width for true center alignment
                            const SizedBox(width: 50),
                          ],
                        ),

                        // 2. Expandable space to push content to the vertical center
                        const Spacer(),

                        // 3. Center Body Content
                        Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.lock_reset_rounded,
                              size: 45,
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: Text(
                            'Trouble logging in?',
                            style: GoogleFonts.ubuntu(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Enter your email address and we\'ll send you a link to reset your password.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        ShadowBox(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              LoginTextfield(
                                labelText: 'Email Address',
                                controller: _emailController,
                              ),
                              const SizedBox(height: 24),
                              LoginButton(
                                onTap: () {
                                  // Trigger password reset logic
                                },
                                buttonText: 'Send Reset Link',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),

                        // 4. Equal bottom spacer balancing the content in the center
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
