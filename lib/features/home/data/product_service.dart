import 'package:dio/dio.dart';
import 'package:store_app/core/services/api_exceptions.dart';
import 'package:store_app/core/services/api_service.dart';
import 'package:store_app/features/home/data/product_model.dart';

class ProductService {
  // List to hold products as a list of ProductModel
  List<ProductModel> products = [];

  // Method to fetch all products from the API ,
  // handle errors using ApiException and return a list of ProductModel
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await ApiService().get('/products');
      final List<dynamic> productsData = response['products'];
      products = productsData
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } on DioException catch (e) {
      ApiException.handleEror(e);
      rethrow;
    }
  }
}
