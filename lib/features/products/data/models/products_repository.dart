import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';

class ProductsRepository {
  final Dio _dio = DioClient().dio;

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      final List data = response.data['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}
