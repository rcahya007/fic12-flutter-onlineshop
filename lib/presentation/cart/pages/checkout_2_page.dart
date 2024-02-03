// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class Checkout2Page extends StatefulWidget {
  const Checkout2Page({super.key});

  @override
  State<Checkout2Page> createState() => _Checkout2PageState();
}

class _Checkout2PageState extends State<Checkout2Page> {
  List deliveryMethod = [
    'By Courier',
    'Pick Up',
  ];
  int selectedIndex = 0;

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
                                  '2 of 3',
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
                    const SubTitleSection(title: 'delivery method'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: deliveryMethod.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CardDeliveryMethod(
                                selectedIndex: selectedIndex,
                                index: index,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              );
                            }),
                      ]),
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
                onTap: () {},
                widgetInside: Text(
                  'Continue',
                  style: body1semi,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDeliveryMethod extends StatelessWidget {
  final Function()? onTap;
  final int selectedIndex;
  final int index;
  const CardDeliveryMethod({
    Key? key,
    this.onTap,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.5),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.car.path,
              colorFilter: const ColorFilter.mode(
                colorBlack,
                BlendMode.srcIn,
              ),
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By courier',
                    style: body1reg,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Tomorrow, any time',
                    style: body2reg.copyWith(
                      color: colorGiratina500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? colorCharizard400
                    : colorGiratina100,
                borderRadius: BorderRadius.circular(100),
              ),
              child: index == selectedIndex
                  ? SvgPicture.asset(
                      Assets.icons.checkmark.path,
                      height: 16,
                      width: 16,
                      colorFilter: const ColorFilter.mode(
                        colorBlack,
                        BlendMode.srcIn,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
