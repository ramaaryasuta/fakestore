import 'dart:developer';

import '../../../core/utils/dio_client.dart';
import '../../../core/utils/api_path.dart';
import 'product_model.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    try {
      final response = await DioClient().getRequest(path: APiPath.products);
      if (response.statusCode != 200) return [];
      var product = (response.data as List).map((e) => Product.fromJson(e));
      return product.toList();
    } catch (e, s) {
      log('getProduct error : $e, $s');
      throw Exception('getProduct error : $e');
    }
  }
}
