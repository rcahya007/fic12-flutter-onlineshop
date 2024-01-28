part of 'product_by_category_bloc.dart';

@freezed
class ProductByCategoryEvent with _$ProductByCategoryEvent {
  const factory ProductByCategoryEvent.started() = _Started;
  const factory ProductByCategoryEvent.getAllProductsByCategory(int idCategory) = _GetAllProductsByCategory;

}