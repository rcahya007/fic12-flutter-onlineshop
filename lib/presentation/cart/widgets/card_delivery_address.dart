// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/address_response_model.dart';

class DeliveryAddress extends StatelessWidget {
  final Address address;
  const DeliveryAddress({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.pin.path,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              colorBlack,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.fullAddress!,
                  style: body1reg,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${address.name}, ${address.phone}',
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
          SvgPicture.asset(
            Assets.icons.chevronRight.path,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              colorBlack,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
