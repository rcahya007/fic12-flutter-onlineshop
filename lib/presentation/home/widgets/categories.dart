// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/category_response_model.dart';

class Categories extends StatelessWidget {
  final String idRoom;
  final String nameRoom;
  final List<Category> categories;
  const Categories({
    Key? key,
    required this.idRoom,
    required this.nameRoom,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // print(
            //   context.namedLocation(
            //     'catalog',
            //     queryParameters: {
            //       'idRoom': idRoom,
            //       'nameRoom': nameRoom,
            //       'idCategory': categories[index].id.toString(),
            //       'nameCategoty': categories[index].name,
            //     },
            //   ),
            // );
            context.goNamed(
              'catalog',
              queryParameters: {
                'idRoom': idRoom,
                'nameRoom': nameRoom,
                'idCategory': categories[index].id.toString(),
                'nameCategoty': categories[index].name,
              },
            );
          },
          child: Container(
            color: colorWhite,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    '${Variables.baseUrl}/storage/category/${categories[index].image}',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  categories[index].name!,
                  style: body1reg,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
