import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/nowPlayingMovies/model/now_playing_movies_data.dart';
import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';

class NowPlayingMoviesApi {
  Future<NowPlayingMoviesData?> getMovie() async {
    Response? response;
    try {
      response = await NetworkBase.dio.get(ApiEndpoint.endPointMovies, 
      options: Options(headers: {'Connection': 'keep-alive'}));

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
