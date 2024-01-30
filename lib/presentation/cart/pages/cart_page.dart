import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56,
              ),
              const TitleSection(name: 'bag'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      children: [
                        Container(
                          height: 115,
                          width: 94,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorGiratina500,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/200',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$150.00',
                                      style: body1semi,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    Assets.icons.clear.path,
                                    height: 24,
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                      colorGiratina500,
                                      BlendMode.srcIn,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Wooden bedside table featuring a raised design',
                                style: body3reg.copyWith(
                                  color: colorGiratina500,
                                ),
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              Container(
                                width: 98,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: colorGiratina100,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.minus.path,
                                      width: 20,
                                      height: 20,
                                      colorFilter: const ColorFilter.mode(
                                          colorBlack, BlendMode.srcIn),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '8',
                                          style: body2semi,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      Assets.icons.plus.path,
                                      width: 20,
                                      height: 20,
                                      colorFilter: const ColorFilter.mode(
                                          colorBlack, BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'promocode',
                  style: heading2semi,
                ),
              ),
            ],
          ),
        ),
      ),

      // If Empty Cart Bag
      // EmptyPage(
      //   title: 'bag',
      //   descriptionPage: 'your bag is empty',
      //   detailPage:
      //       'items remain in your bag for 1 hour, and then they’re moved to your Saved items',
      //   textButton: 'Start Shopping',
      //   urlImage: Assets.images.surprised.path,
      //   onTap: () {},
      // ),
    );
  }
}
