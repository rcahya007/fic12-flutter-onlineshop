import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    'register account',
                    style: heading1semi,
                  ),
                  Text(
                    'hello, please complete the data below to register a new account',
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
                      TextField(
                        controller: _confirmPasswordController,
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
                            'Already accout? ',
                            style: body3reg.copyWith(
                              color: colorGiratina500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.goNamed('login');
                            },
                            child: Text(
                              'Login Now',
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: ButtonNextAction(onTap: () {}, textButton: 'Register'),
            )
          ],
        ),
      ),
    );
  }
}
