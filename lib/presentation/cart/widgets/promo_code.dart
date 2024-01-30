import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleSection(
          title: 'promocode',
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: colorGiratina100,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: body1reg,
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Enter promo code',
                      hintStyle: body1reg.copyWith(
                        color: colorGiratina500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.icons.clear.path,
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      colorBlack,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
