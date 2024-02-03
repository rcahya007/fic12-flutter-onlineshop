import 'package:dartz/dartz.dart';
import 'package:flutter_fic12_onlineshop/core/constants/variables.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/address_response_model.dart';
import 'package:http/http.dart' as http;

class AddressRemoteDatasource {
  Future<Either<String, AddressResponseModel>> getAddress() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http
          .get(Uri.parse('${Variables.baseUrl}/api/addresses'), headers: {
        'Authorization': 'Bearer ${authData!.accessToken}',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        return Right(AddressResponseModel.fromJson(response.body));
      } else {
        return const Left('Failed to get address');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
