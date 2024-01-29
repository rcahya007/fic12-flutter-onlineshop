import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/components/grid_view_product.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/product_by_category/product_by_category_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class CatalogPage extends StatefulWidget {
  final String idCategory;
  final String nameCategory;
  const CatalogPage({
    Key? key,
    required this.idCategory,
    required this.nameCategory,
  }) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late TextEditingController _searchProductController;

  @override
  void initState() {
    super.initState();
    _searchProductController = TextEditingController();
    context.read<ProductByCategoryBloc>().add(ProductByCategoryEvent.getAllProductsByCategory(int.parse(widget.idCategory)));
  }

  @override
  void dispose() {
    _searchProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      Assets.icons.arrowLeft.path,
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        colorBlack,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.nameCategory,
                      style: body1semi,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Search(seacrhController: _searchProductController),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorGiratina100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sort',
                            style: body2semi,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            Assets.icons.directionVertical.path,
                            height: 18,
                            width: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorGiratina100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Filter',
                            style: body2semi,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            Assets.icons.filter.path,
                            height: 18,
                            width: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (products) => GridViewProduct(products: products),
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
      ),
    );
  }
}
