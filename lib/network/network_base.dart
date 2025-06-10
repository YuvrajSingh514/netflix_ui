import 'package:dio/dio.dart';
import 'package:movies_app/network/api_endpoint.dart';

class NetworkBase {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      queryParameters: {
        'api_key': '647adb592ac9d078192fb998036da48b',
      },
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3),
      sendTimeout: Duration(seconds: 3),
    ),
  );
}
