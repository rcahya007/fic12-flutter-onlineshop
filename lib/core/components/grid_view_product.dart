import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/components/card_product.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';

class GridViewProduct extends StatelessWidget {
  final List<Product> products;
  const GridViewProduct({
    super.key,
    required this.products,
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
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CardProduct(
          name: products[index].name ?? 'Product $index',
          price: products[index].price ?? 0,
          urlImage:
              '${Variables.baseUrl}/storage/products/${products[index].image}',
          isNewProduct: index % 2 == 0,
          isLiked: index % 2 == 0,
          description:
              products[index].description ?? 'Lorem ipsum dolor sit amet',
        );
      },
    );
  }
}
