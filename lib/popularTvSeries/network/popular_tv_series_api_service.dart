import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/popularTvSeries/model/popular_tv_series_model.dart';

class PopularTvSeriesApiService {
  Future<PopularTvSeriesModel?> getPopularTvSeries() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.popularTvSeries, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        PopularTvSeriesModel popularTvSeriesModel = PopularTvSeriesModel.fromJson(
          response.data,
        );
        return popularTvSeriesModel;
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
