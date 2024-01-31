import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/login/login_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: body1reg,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: body1reg.copyWith(
                            color: colorGiratina500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 9.5,
                            horizontal: 16,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colorGiratina100,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: colorGiratina300,
                              width: 10,
                            ),
                          ),
                          filled: true,
                          fillColor: colorGiratina100,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: obscureText,
                        style: body1reg,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: body1reg.copyWith(
                            color: colorGiratina500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 9.5,
                            horizontal: 16,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colorGiratina100,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: colorGiratina300,
                              width: 10,
                            ),
                          ),
                          filled: true,
                          fillColor: colorGiratina100,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: SvgPicture.asset(
                                obscureText
                                    ? Assets.icons.eyeClosed.path
                                    : Assets.icons.eye.path,
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                    colorBlack, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          suffixIconConstraints: const BoxConstraints(),
                        ),
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
                      context.goNamed('User');
                      context.goNamed('home');
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
                      onTap: () {
                        context.read<LoginBloc>().add(
                              LoginEvent.login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
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
    );
  }
}
