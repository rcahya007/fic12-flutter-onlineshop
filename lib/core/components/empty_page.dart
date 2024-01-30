import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  final String descriptionPage;
  final String detailPage;
  final String textButton;
  final String urlImage;
  final VoidCallback onTap;
  const EmptyPage({
    Key? key,
    required this.title,
    required this.descriptionPage,
    required this.detailPage,
    required this.textButton,
    required this.urlImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 56,
        ),
        TitleSection(
          name: title,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  urlImage,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  descriptionPage,
                  style: heading2semi,
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    detailPage,
                    style: body1reg.copyWith(
                      color: colorGiratina500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonNextAction(textButton: textButton, onTap: onTap),
      ],
    ));
  }
}


