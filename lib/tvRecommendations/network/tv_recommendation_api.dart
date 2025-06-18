import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/tvRecommendations/model/tv_recommendation_model.dart';

class TvRecommendationApi {
  Future<TvRecommendationsModel?> getTvRecommendation(int seriesId) async {
    try {
      final response = await NetworkBase.dio.get(
        ApiEndpoint.tvRecommendation(seriesId),
        options: Options(headers: {'Connection': 'keep-alive'}),
      );

      if (response.statusCode == 200) {
        return TvRecommendationsModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
