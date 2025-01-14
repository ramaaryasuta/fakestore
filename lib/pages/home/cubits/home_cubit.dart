import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/product_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    try {
      final products = await ProductRepository().getProducts();
      log('productsCubit: $products');
      emit(HomeLoaded(products: products));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
