import 'package:bloc/bloc.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';
part 'product_by_category_bloc.freezed.dart';

class ProductByCategoryBloc extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  ProductByCategoryBloc() : super(_Initial()) {
    on<ProductByCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
