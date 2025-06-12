import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/moviesDetail/model/movies_detail_model.dart';

import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';

class MoviesDetailApiService {
  Future<MoviesDetailModel?> getMovieDetail(int movieId) async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.movieDetail, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        MoviesDetailModel moviesDetailModel = MoviesDetailModel.fromJson(
          response.data,
        );
        return moviesDetailModel;
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
