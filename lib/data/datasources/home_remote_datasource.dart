import 'package:dartz/dartz.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/category_response_model.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/room_response_model.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDatasource {
  Future<Either<String, RoomResponseModel>> getRooms() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/rooms'));
    if (response.statusCode == 200) {
      return Right(RoomResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  Future<Either<String, CategoryResponseModel>> getCategories(
      int roomId) async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/categories?room_id=$roomId'),
    );

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }
}
