import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/upcomingMovies/model/upcoming_movies_model.dart';


class UpcomingMoviesService {
  Future<UpcomingMoviesModel?> getUpcomingMovie() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.upcomingMoviesEndPoint, 
      options: Options(headers: {'Connection': 'keep-alive'}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        UpcomingMoviesModel upcomingPlayingMovies = UpcomingMoviesModel.fromJson(
          response.data,
        );
        return upcomingPlayingMovies;
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
