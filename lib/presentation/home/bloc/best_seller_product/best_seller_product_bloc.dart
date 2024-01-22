// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/datasources/product_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';

part 'best_seller_product_bloc.freezed.dart';
part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  BestSellerProductBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      final response = await _productRemoteDatasource.getProductByCategory(1);
      response.fold(
        (l) => emit(BestSellerProductState.error(l)),
        (r) => emit(BestSellerProductState.loaded(r.data!.data!)),
      );
    });
  }
}
