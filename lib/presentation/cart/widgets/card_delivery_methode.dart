// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class CardDeliveryMethod extends StatelessWidget {
  final Function()? onTap;
  final int selectedIndex;
  final int index;
  final String urlImage;
  final String title;
  final String subTitle;
  const CardDeliveryMethod({
    Key? key,
    this.onTap,
    required this.selectedIndex,
    required this.index,
    required this.urlImage,
    required this.title,
    required this.subTitle,
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
              urlImage,
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
                    title,
                    style: body1reg,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle,
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
