import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:store_app/core/services/api_service.dart';

import '../../../../core/services/api_exceptions.dart';

class AllCategoriesService {
  List<AllCategoriesService> Categories = [];

  Future<List<AllCategoriesService>> getAllCategories() async {
    try{
      final Response response = await ApiService().get('/categories');
      Categories = response.data;
      return Categories ;
    }
    on DioException catch(e){
      ApiException.handleError(e);
      rethrow;
    }
  }
}
