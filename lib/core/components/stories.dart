import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class Stories extends StatelessWidget {
  const Stories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      height: 104,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 88,
          width: 88,
          margin: const EdgeInsets.only(
            right: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: colorGiratina500,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/${Random().nextInt(1000)}/300/200',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 48,
                  left: 8,
                  right: 8,
                  bottom: 8,
                ),
                child: Text(
                  'Product stories ${index + 1}',
                  maxLines: 2,
                  style: body3semi.copyWith(
                    color: colorWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}