import 'package:dio/dio.dart';
import 'package:movies_app/network/api_endpoint.dart';

class NetworkBase {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3),
      sendTimeout: Duration(seconds: 3),
    ),
  );
}
