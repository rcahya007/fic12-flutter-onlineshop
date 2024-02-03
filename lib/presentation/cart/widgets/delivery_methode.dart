import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/components/sub_title_section.dart';
import 'package:flutter_fic12_onlineshop/presentation/cart/widgets/card_delivery_methode.dart';

// ignore: must_be_immutable
class DeliveryMethod extends StatefulWidget {
  DeliveryMethod({
    super.key,
    required this.deliveryMethod,
    required this.selectedIndex,
  });

  final List deliveryMethod;
  int? selectedIndex;

  @override
  State<DeliveryMethod> createState() => _DeliveryMethodState();
}

class _DeliveryMethodState extends State<DeliveryMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleSection(title: 'delivery method'),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.deliveryMethod.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CardDeliveryMethod(
                    urlImage: widget.deliveryMethod[index]['urlImage'],
                    title: widget.deliveryMethod[index]['title'],
                    subTitle: widget.deliveryMethod[index]['subTitle'],
                    selectedIndex: widget.selectedIndex!,
                    index: index,
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = index;
                      });
                    },
                  );
                }),
          ]),
        ),
      ],
    );
  }
}
