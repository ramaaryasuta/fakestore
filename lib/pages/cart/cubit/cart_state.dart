import '../../home/data/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<Product> cart;

  CartUpdated(this.cart);

  List<Object> get props => [cart];
}
