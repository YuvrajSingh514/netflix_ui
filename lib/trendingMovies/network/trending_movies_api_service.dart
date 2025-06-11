

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/trendingMovies/model/trending_movies_model.dart';

class TrendingMoviesApiService {
  Future<TrendingMoviesModel?> getTrendingMovies() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.trendingMovies, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        TrendingMoviesModel trendingMoviesModel = TrendingMoviesModel.fromJson(
          response.data,
        );
        return trendingMoviesModel;
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