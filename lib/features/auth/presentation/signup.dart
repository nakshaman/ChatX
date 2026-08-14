import 'package:chatx/features/auth/bloc/auth_bloc.dart';
import 'package:chatx/features/auth/components/login_button.dart';
import 'package:chatx/features/auth/components/login_textfield.dart';
import 'package:chatx/features/auth/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
          if (state is SignUpToLogInScreenState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //image
                    Lottie.asset('assets/lottie/message.json'),
                    LoginTextfield(
                      labelText: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // email field
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
                            authBloc.add(AuthNavigateToLogIn());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account ?',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Login',
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
            ),
          );
        },
      ),
    );
  }
}
