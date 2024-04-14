import 'package:dio/dio.dart';

class DioClient {

  final Dio _dio = Dio();
  String baseUrl = "https://lavie.orangedigitalcenteregypt.com";

  DioClient(){
    _dio
      ..options.baseUrl = baseUrl
      ..options.responseType = ResponseType.json;
  }


  Future<Response> get(
      String url, {
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {

    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String url, {
        dynamic data,
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {

    try {
      final Response response = await _dio.post(
        url,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}