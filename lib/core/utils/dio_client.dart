import 'package:dio/dio.dart';

const String baseUrl = 'https://fakestoreapi.com';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(baseUrl: baseUrl));

  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    dio.options.headers.remove('Authorization');
  }

  Future<Response<dynamic>> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await safeApiCall(
        () => dio.get(path, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> postRequest({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    return await safeApiCall(() => dio.post(path, data: data));
  }

  Future<Response<dynamic>> safeApiCall(
      Future<Response<dynamic>> Function() apiCall) async {
    try {
      final response = await apiCall();
      return response;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
