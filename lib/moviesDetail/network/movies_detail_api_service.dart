import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/moviesDetail/model/movies_detail_model.dart';

import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';

class MoviesDetailApiService {
  Future<MoviesDetailModel> getMovieDetail(int movieId) async {
    try {
      final response = await NetworkBase.dio.get(
        ApiEndpoint.movieDetail(movieId),
        options: Options(headers: {'Connection': 'keep-alive'}),
      );

      if (response.statusCode == 200) {
        return MoviesDetailModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
