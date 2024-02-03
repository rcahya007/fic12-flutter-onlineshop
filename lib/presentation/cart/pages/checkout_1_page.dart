import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/input_form_custom.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  final GlobalKey<FormState> _checkout1 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    getLocalUser();
    super.initState();
  }

  void getLocalUser() async {
    final user = await AuthLocalDatasource().getAuthData();
    nameController.text = user!.user!.name!;
    phoneController.text = user.user!.phone!;
    emailController.text = user.user!.email!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _checkout1,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: SvgPicture.asset(
                                Assets.icons.arrowLeft.path,
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Checkout',
                                    style: body1semi,
                                  ),
                                  Text(
                                    '1 of 3',
                                    style: body3semi.copyWith(
                                      color: colorGiratina500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SubTitleSection(title: 'contact info'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            InputFormCustom(
                              controller: nameController,
                              isPassword: false,
                              obscureText: false,
                              title: 'Full name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            InputFormCustom(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              isPassword: false,
                              obscureText: false,
                              title: 'Phone',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your number phone';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            InputFormCustom(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              isPassword: false,
                              obscureText: false,
                              title: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch((value))) {
                                  return null;
                                }
                                return 'Please enter a valid email';
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: ButtonNextAction(
                  onTap: () {
                    if (_checkout1.currentState!.validate()) {
                      context.push(context.namedLocation('checkout-2'));
                    }
                  },
                  widgetInside: Text(
                    'Continue',
                    style: body1semi,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
