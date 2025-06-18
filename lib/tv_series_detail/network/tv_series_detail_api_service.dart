import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/tv_series_detail/model/tv_series_detail_model.dart';

class TvSeriesDetailApiService {
  Future<TvSeriesDetailModel> getTvSeriesDetail(int seriesId) async {
    try {
      final response = await NetworkBase.dio.get(
        ApiEndpoint.tvSeriesDetail(seriesId),
        options: Options(headers: {'Connection': 'keep-alive'}),
      );

      if (response.statusCode == 200) {
        return TvSeriesDetailModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
