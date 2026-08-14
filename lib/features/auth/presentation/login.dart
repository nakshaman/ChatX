import 'package:chatx/features/auth/bloc/auth_bloc.dart';
import 'package:chatx/features/auth/components/login_button.dart';
import 'package:chatx/features/auth/components/login_textfield.dart';
import 'package:chatx/features/auth/presentation/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
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
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //image
                  Lottie.asset('assets/lottie/profile.json'),
                  // email field
                  LoginTextfield(
                    labelText: 'Login',
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
                    isObsecureText: true,
                  ),
                  // space
                  const SizedBox(
                    height: 15,
                  ),
                  // button
                  LoginButton(onTap: () {}),
                  // space
                  const SizedBox(
                    height: 25,
                  ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Didn\'t have an account ?',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
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
    );
  }
}
