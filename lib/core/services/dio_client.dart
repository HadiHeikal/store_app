import 'package:dio/dio.dart';
import 'package:store_app/core/constants/app_strings.dart';
import 'package:store_app/core/utils/pref_helpers.dart';

class DioClient {
  // Base options for Dio
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // interceptors for logging and error handling
  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken();
          token.isNotEmpty && token != 'null'
              ? options.headers['Authorization'] = 'Bearer $token'
              : null;
          return handler.next(options);
        },
      ),
    );
  }
  // Getter for Dio instance
  Dio get dio => _dio;
}
