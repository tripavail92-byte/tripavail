import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio;

  Dio get client => _dio;
}
