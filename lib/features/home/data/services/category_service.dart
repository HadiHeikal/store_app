import 'package:dio/dio.dart';
import 'package:store_app/core/services/api_exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../models/product_model.dart';

class CategoryService {
  List<ProductModel> categories = [];
  // get all product that category name is $category
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      final response = await ApiService().get('/products/category/$category');
      final List<dynamic> productsData = response['products'];
      categories = productsData
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return categories;
    } on DioException catch (e) {
      ApiException.handleError(e);
      rethrow;
    }
  }
}
