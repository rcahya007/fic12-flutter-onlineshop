// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/empty_page.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic12_onlineshop/presentation/bloc/change_index_menu/change_index_menu_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/cart_bag.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/promo_code.dart';

import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/total_cart.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (products) {
              final totalProdcut = products.length;
              final totalQuantity = products.fold(0,
                  (previousValue, element) => previousValue + element.quantity);
              if (totalProdcut == 0) {
                return EmptyPage(
                  title: 'bag',
                  descriptionPage: 'your bag is empty',
                  detailPage:
                      'items remain in your bag for 1 hour, and then they’re moved to your Saved items',
                  textButton: 'Start Shopping',
                  urlImage: Assets.images.surprised.path,
                  onTap: () {
                    context
                        .read<ChangeIndexMenuBloc>()
                        .add(const ChangeIndexMenuEvent.changeIndexMenu(0));
                    context.goNamed('home');
                  },
                );
              } else {
                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 56,
                              ),
                              const TitleSection(name: 'bag'),
                              CartBag(products: products),
                              //Component Promocode
                              const PromoCode(),

                              // Total Cart
                              const TotalCart(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: ButtonNextAction(
                          onTap: () async {
                            final isAuth = await AuthLocalDatasource().isAuth();
                            if (!isAuth) {
                              if (context.mounted) {
                                context.goNamed('login');
                              }
                            } else {
                              if (context.mounted) {
                                context
                                    .push(context.namedLocation('checkout-1'));
                              }
                            }
                          },
                          widgetInside: Text(
                            'Checkout ($totalQuantity)',
                            style: body1semi,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => const SizedBox(),
          );
        },
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
