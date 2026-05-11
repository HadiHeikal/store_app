import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/core/services/api_service.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import '../../../../core/services/api_exceptions.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await ApiService().get('/products');
      log('API Response Data: $response'); // Log the response data

      if (response == null) {
        throw Exception('API returned null data');
      }

      if (response['products'] is List) {
        return (response['products'] as List<dynamic>)
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      ApiException.handleError(e);
      rethrow;
    }
  }
}
