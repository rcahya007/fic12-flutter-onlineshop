part of 'product_by_category_bloc.dart';

@freezed
class ProductByCategoryState with _$ProductByCategoryState {
  const factory ProductByCategoryState.initial() = _Initial;
  const factory ProductByCategoryState.loading() = _Loading;
  const factory ProductByCategoryState.loaded(List<Product> products) = _Loaded;
  const factory ProductByCategoryState.error(String message) = _Error;
}
