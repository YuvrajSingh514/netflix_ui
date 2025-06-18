import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/MoviesRecomendation/model/movies_recommendation_model.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';

class MoviesRecommendationApi {
  Future<MoviesRecommendationModel?> getMoviesRecommendation(int movieId) async {
    try {
      final response = await NetworkBase.dio.get(
        ApiEndpoint.moviesRecommendation(movieId),
        options: Options(headers: {'Connection': 'keep-alive'}),
      );

      if (response.statusCode == 200) {
        return MoviesRecommendationModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
