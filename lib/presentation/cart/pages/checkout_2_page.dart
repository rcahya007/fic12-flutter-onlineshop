// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/bloc/address/address_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/card_delivery_address.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/delivery_methode.dart';

class Checkout2Page extends StatefulWidget {
  const Checkout2Page({super.key});

  @override
  State<Checkout2Page> createState() => _Checkout2PageState();
}

class _Checkout2PageState extends State<Checkout2Page> {
  @override
  void initState() {
    context.read<AddressBloc>().add(const AddressEvent.getAddressByUser());
    super.initState();
  }

  List deliveryMethod = [
    {
      'urlImage': Assets.icons.car.path,
      'title': 'By courier',
      'subTitle': 'Tomorrow, any time',
    },
    {
      'urlImage': Assets.icons.cart.path,
      'title': 'I\'ll take it myself',
      'subTitle': 'Any day from tomorrow',
    },
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
                    DeliveryMethod(
                      deliveryMethod: deliveryMethod,
                      selectedIndex: selectedIndex,
                    ),
                    const SubTitleSection(title: 'delivery address'),
                    BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                            orElse: () => const SizedBox(),
                            error: (message) => const Center(
                                  child: Text('error'),
                                ),
                            loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            loaded: (address) {
                              if (address.isEmpty) {
                                return const Center(
                                  child: Text(
                                      'No address found, please add your address first'),
                                );
                              } else {
                                final addressDefault = address.firstWhere(
                                    (element) => element.isDefault == 1);
                                return DeliveryAddress(address: addressDefault);
                              }
                            });
                        // return GestureDetector(
                        //   onTap: () {
                        //     showModalBottomSheet(
                        //       backgroundColor: colorWhite,
                        //       context: context,
                        //       builder: (context) {
                        //         return SingleChildScrollView(
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: <Widget>[
                        //               const SizedBox(
                        //                 height: 56,
                        //               ),
                        //               const TitleSection(
                        //                   name: 'delivery address'),
                        //               ListView.builder(
                        //                 physics:
                        //                     const NeverScrollableScrollPhysics(),
                        //                 shrinkWrap: true,
                        //                 itemCount: 2,
                        //                 itemBuilder: (context, index) {
                        //                   return DeliveryAddress(
                        //                     titleStreet: 'Street $index',
                        //                     detailsStreet:
                        //                         'Detail Street $index',
                        //                   );
                        //                 },
                        //               ),
                        //               const SizedBox(
                        //                 height: 16,
                        //               ),
                        //               Padding(
                        //                 padding: const EdgeInsets.only(
                        //                   bottom: 16,
                        //                 ),
                        //                 child: ButtonNextAction(
                        //                   onTap: () {
                        //                     context.pop();
                        //                   },
                        //                   color: colorGiratina500,
                        //                   widgetInside: Text(
                        //                     'Cancel',
                        //                     style: body1semi,
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         );
                        //       },
                        //     );
                        //   },
                        //   child: const DeliveryAddress(
                        //     titleStreet: 'London, 221B Baker Street',
                        //     detailsStreet: 'Hanna Gouse, +7 932 123-43-23',
                        //   ),
                        // );
                      },
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
