import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/hotNews/model/hot_news_model.dart';

class HotNewsApi {
  Future<HotNewsModel?> getHotNewsList() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.hotNews, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        HotNewsModel hotNewsModel = HotNewsModel.fromJson(
          response.data,
        );
        return hotNewsModel;
      } else {
        return null;
      }
    } on DioException catch (de) {
      log('$de');
      throw Exception(de);
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
