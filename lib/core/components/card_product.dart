// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/extensions/int_ext.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final bool isNewProduct;
  final bool isLiked;

  const CardProduct({
    Key? key,
    required this.product,
    required this.isNewProduct,
    required this.isLiked,
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
                    '${Variables.baseUrl}/storage/products/${product.image}',
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
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<CheckoutBloc>()
                          .add(CheckoutEvent.addToCart(product));
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(
                            color: colorBlack.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.bag.path,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.name!,
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
                  product.price!.currencyFormatRp,
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
            product.description!,
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
