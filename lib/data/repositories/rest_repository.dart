// ignore_for_file: prefer_initializing_formals

import 'package:dio/dio.dart';

class RestService {
  factory RestService({required String baseUrl}) {
    _singleton.tokenDio = Dio(BaseOptions(baseUrl: baseUrl));
    _singleton.dio = createDio(baseUrl);
    return _singleton;
  }

  late Dio dio;
  late Dio tokenDio;

  RestService._internal();

  static final _singleton = RestService._internal();

  static Dio createDio(String baseUrl) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 45000, // 15 seconds
      connectTimeout: 45000,
      sendTimeout: 15000,
    ));

    return dio;
  }
}
