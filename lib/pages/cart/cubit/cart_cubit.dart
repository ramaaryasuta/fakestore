import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/data/product_model.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<Product> _cart = [];

  //get all cart
  List<Product> get cart => List.unmodifiable(_cart);

  void addToCart(Product product) {
    _cart.add(product);
    emit(CartUpdated(List.unmodifiable(_cart)));
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    emit(CartUpdated(List.unmodifiable(_cart)));
  }
}
