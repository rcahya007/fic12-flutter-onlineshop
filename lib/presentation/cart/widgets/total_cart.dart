import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/core/extensions/int_ext.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';

class TotalCart extends StatelessWidget {
  const TotalCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'total',
                style: heading2semi,
              ),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (products) {
                      final total = products.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.quantity * element.product.price!));
                      return Text(
                        total.currencyFormatRp,
                        style: heading2semi,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (message) => Center(
                      child: Text(message),
                    ),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Promocode',
                style: body1reg.copyWith(
                  color: colorGiratina500,
                ),
              ),
              Text(
                '−\$25,00',
                style: body1reg.copyWith(
                  color: colorGiratina500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
