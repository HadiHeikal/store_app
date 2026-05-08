import 'package:dio/dio.dart';
import 'package:store_app/core/services/api_service.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import '../../../../core/services/api_exceptions.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String image,
    required String description,
    required String price,
    required String category }) async{
    try{
      Map<String,dynamic> data = await ApiService().put('/products' , data: {
        'title' : title,
        'description' : description,
        'image' : image,
        'price' : price,
        'category' : category,
      });
      return ProductModel.fromJson(data) ;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    }
  }
}