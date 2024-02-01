import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              context.pop();
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
