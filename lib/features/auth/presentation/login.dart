import 'package:chatx/features/auth/bloc/auth_bloc.dart';
import 'package:chatx/features/auth/components/login_button.dart';
import 'package:chatx/features/auth/components/login_textfield.dart';
import 'package:chatx/features/auth/components/shadow_box.dart';
import 'package:chatx/features/auth/presentation/forgot_password.dart';
import 'package:chatx/features/auth/presentation/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listenWhen: (previous, current) => current is AuthActionState,
          buildWhen: (previous, current) => current is! AuthActionState,
          listener: (context, state) {
            if (state is LoginToSignUpScreenState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Signup(),
                ),
              );
            }
            if (state is LoginToForgotPasswordScreenState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ForgotPassword(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  top: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //image
                    Lottie.asset('assets/lottie/profile.json'),
                    // email, password,
                    ShadowBox(
                      child: Column(
                        children: [
                          LoginTextfield(
                            labelText: 'Email',
                            controller: emailController,
                          ),
                          // space
                          const SizedBox(
                            height: 10,
                          ),
                          // password field
                          LoginTextfield(
                            labelText: 'Password',
                            controller: passwordController,
                            isPassword: true,
                          ),
                          // space
                          const SizedBox(
                            height: 30,
                          ),
                          // button
                          LoginButton(
                            onTap: () {
                              authBloc.add(AuthLoginRequestedEvent());
                            },
                            buttonText: 'Login',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    // space
                    const SizedBox(
                      height: 25,
                    ),
                    // forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            authBloc.add(AuthNavigateToForgotPassword());
                          },
                          child: Text(
                            'Forgot Password',
                            style: GoogleFonts.ubuntu(
                              color: Theme.of(
                                context,
                              ).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // last line didn't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            authBloc.add(AuthNavigateToSignUp());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Didn\'t have an account ?',
                                    style: GoogleFonts.lato(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '   Sign Up',
                                    style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
