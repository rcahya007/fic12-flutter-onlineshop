// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/room_response_model.dart';
import 'package:go_router/go_router.dart';

class Rooms extends StatelessWidget {
  final List<Room> rooms;
  const Rooms({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: rooms.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.goNamed('categories', queryParameters: {
              'idRoom': rooms[index].id.toString(),
            }, pathParameters: {
              'nameRoom': rooms[index].name!,
            });
          },
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            height: 100,
            decoration: BoxDecoration(
              color: colorGiratina100,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      rooms[index].name!,
                      style: heading2semi,
                    ),
                  ),
                ),
                SizedBox(
                  width: 82,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(
                        8,
                      ),
                    ),
                    child: Image.network(
                      '${Variables.baseUrl}/storage/rooms/${rooms[index].image}',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
