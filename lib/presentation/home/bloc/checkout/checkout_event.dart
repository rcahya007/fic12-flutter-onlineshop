part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addToCart(Product product) = _AddToProduct;
  const factory CheckoutEvent.removeFromCart(Product product) = _RemoveFromProduct;
}