// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatefulWidget {
  final String idRoom;
  final String nameRoom;
  const CategoriesPage({
    Key? key,
    required this.idRoom,
    required this.nameRoom,
  }) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late TextEditingController _searchCategoriesController;

  @override
  void initState() {
    super.initState();
    _searchCategoriesController = TextEditingController();
  }

  @override
  void dispose() {
    _searchCategoriesController.dispose();
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
                      widget.nameRoom,
                      style: body1semi,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Search(seacrhController: _searchCategoriesController),
            const TitleSection(name: 'categories'),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://via.placeholder.com/150',
                            width: 36,
                            height: 36,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Category ${index + 1}',
                          style: body1reg,
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
