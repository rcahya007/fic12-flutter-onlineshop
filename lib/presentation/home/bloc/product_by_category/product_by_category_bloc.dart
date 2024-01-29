// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/datasources/product_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';

part 'product_by_category_bloc.freezed.dart';
part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  ProductByCategoryBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAllProductsByCategory>((event, emit) async {
      emit(const ProductByCategoryState.loading());
      final response =
          await _productRemoteDatasource.getProductByCategory(event.idCategory);

      response.fold(
        (l) => emit(ProductByCategoryState.error(l)),
        (r) => emit(ProductByCategoryState.loaded(r.data!.data!)),
      );
    });
  }
}
