import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/components/input_form_custom.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/check_auth/check_auth_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56,
              ),
              Container(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'login account',
                      style: heading1semi,
                    ),
                    Text(
                      'hello welcome back to our account',
                      style: body1reg.copyWith(
                        color: colorGiratina500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        InputFormCustom(
                          controller: _emailController,
                          isPassword: false,
                          title: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch((value))) {
                              return null;
                            }
                            return 'Please enter a valid email';
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InputFormCustom(
                          controller: _passwordController,
                          obscureText: true,
                          isPassword: true,
                          title: 'Password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Not registered yet? ',
                              style: body3reg.copyWith(
                                color: colorGiratina500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.goNamed('register');
                              },
                              child: Text(
                                'Create an account',
                                style: body2semi,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      loaded: (auth) {
                        AuthLocalDatasource().saveAuthData(auth);
                        context.goNamed('user');
                        context
                            .read<CheckAuthBloc>()
                            .add(const CheckAuthEvent.check());
                      },
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      });
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: ButtonNextAction(
                        onTap: () async {
                          if (_loginKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                        widgetInside: Text(
                          'Login',
                          style: body1semi,
                        ),
                      ),
                    ),
                    loading: () => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: ButtonNextAction(
                        onTap: () {},
                        widgetInside: const CircularProgressIndicator(),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
