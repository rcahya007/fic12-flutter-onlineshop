import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardProduct extends StatelessWidget {
  final String name;
  final int price;
  final String urlImage;
  final bool isNewProduct;
  final bool isLiked;
  final String description;

  const CardProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.urlImage,
    required this.isNewProduct,
    required this.isLiked,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 268,
      width: 164,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorGiratina100),
            height: 200,
            width: 164,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    urlImage,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
                isNewProduct
                    ? Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: colorCharizard400,
                          ),
                          child: Center(
                            child: Text(
                              'new',
                              style: body2semi,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: body1semi,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '\$${price.toString()}',
                  style: body1semi,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              isLiked
                  ? SvgPicture.asset(
                      Assets.icons.heart.path,
                      colorFilter: const ColorFilter.mode(
                        colorBlack,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      Assets.icons.heartFilled.path,
                      colorFilter: const ColorFilter.mode(
                        colorBlack,
                        BlendMode.srcIn,
                      ),
                    ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: body3reg.copyWith(
              color: colorGiratina500,
            ),
          ),
        ],
      ),
    );
  }
}