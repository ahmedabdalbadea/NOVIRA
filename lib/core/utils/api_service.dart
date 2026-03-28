import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const String _baseUrl = "http://localhost:5000/";
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get("$_baseUrl$endPoint");

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post("$_baseUrl$endPoint", data: data);

    return response.data;
  }
}
