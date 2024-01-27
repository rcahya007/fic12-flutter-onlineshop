import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/components/card_product.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        childAspectRatio: 1 / 1.75,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CardProduct(
          name: 'Product $index bla bla bla',
          price: 10000,
          urlImage: 'https://picsum.photos/seed/$index/300/200',
          isNewProduct: index % 2 == 0,
          isLiked: index % 2 == 0,
          description:
              'Description $index, by Product $index, product detail bla bla bla is very usefull',
        );
      },
    );
  }
}