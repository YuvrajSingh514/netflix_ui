import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/model/now_playing_movies_data.dart';
import 'package:movies_app/network/api_endpoint.dart';
import 'package:movies_app/network/network_base.dart';

class NowPlayingMoviesApi {
  Future<NowPlayingMoviesData?> getMovie() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.endPointMovies);

      if (response.statusCode == 200) {
        log(response.data.toString());
        NowPlayingMoviesData nowPlayingMovies = NowPlayingMoviesData.fromJson(
          response.data,
        );
        return nowPlayingMovies;
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
