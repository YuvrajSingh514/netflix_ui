import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/topRatedMovies/model/top_rated_movies_model.dart';



class TopRatedMoviesApiService {
  Future<TopRatedMoviesModel?> getTopRatedMovies() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.topRatedMovies, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        TopRatedMoviesModel topRatedMoviesModel = TopRatedMoviesModel.fromJson(
          response.data,
        );
        return topRatedMoviesModel;
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
