import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/product_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_offer_product_event.dart';
part 'special_offer_product_state.dart';
part 'special_offer_product_bloc.freezed.dart';

class SpecialOfferProductBloc
    extends Bloc<SpecialOfferProductEvent, SpecialOfferProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  SpecialOfferProductBloc(this._productRemoteDatasource)
      : super(const _Initial()) {
    on<_GetSpecialProdcuts>((event, emit) async {
      final response = await _productRemoteDatasource.getProductByCategory(4);
      response.fold(
        (l) => emit(SpecialOfferProductState.error(l)),
        (r) => emit(SpecialOfferProductState.loaded(r.data!.data!)),
      );
    });
  }
}
