// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class CatalogPage extends StatefulWidget {
  final String idCategory;
  final String nameCategoty;
  const CatalogPage({
    Key? key,
    required this.idCategory,
    required this.nameCategoty,
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
                      widget.nameCategoty,
                      style: body1semi,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Search(seacrhController: _searchProductController),
          ],
        ),
      ),
    );
  }
}
