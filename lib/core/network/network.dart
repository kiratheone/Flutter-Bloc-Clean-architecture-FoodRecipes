import 'package:dio/dio.dart';

class Network {
  static Dio dioClient() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 40000,
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }

}