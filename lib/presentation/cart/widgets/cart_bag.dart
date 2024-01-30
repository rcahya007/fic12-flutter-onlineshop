import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/core/extensions/int_ext.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/models/product_quantity.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartBag extends StatelessWidget {
  final List<ProductQuantity> products;
  const CartBag({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 94,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorGiratina500,
                    boxShadow: const [
                      BoxShadow(
                        color: colorBlack,
                        blurRadius: 2,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${Variables.baseUrl}/storage/products/${products[index].product.image}',
                    fit: BoxFit.fill,
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
                            'Wooden table',
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
                        ),
                      ],
                    ),
                    Text(
                      products[index].product.price!.currencyFormatRp,
                      style: body3reg,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      products[index].product.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                          GestureDetector(
                            onTap: () {
                              context.read<CheckoutBloc>().add(
                                    CheckoutEvent.removeFromCart(
                                      products[index].product,
                                    ),
                                  );
                            },
                            child: SvgPicture.asset(
                              Assets.icons.minus.path,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                  colorBlack, BlendMode.srcIn),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                products[index].quantity.toString(),
                                style: body2semi,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<CheckoutBloc>().add(
                                    CheckoutEvent.addToCart(
                                      products[index].product,
                                    ),
                                  );
                            },
                            child: SvgPicture.asset(
                              Assets.icons.plus.path,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                  colorBlack, BlendMode.srcIn),
                            ),
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
    );
  }
}
