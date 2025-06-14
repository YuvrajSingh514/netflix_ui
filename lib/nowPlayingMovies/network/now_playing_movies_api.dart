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


// import 'dart:convert';


// import 'package:http/http.dart' as http;

// import 'package:movies_app/nowPlayingMovies/model/now_playing_movies_data.dart';

// class NowPlayingMoviesApi {
//   static String url =
//       'https://api.themoviedb.org/3/movie/now_playing?api_key=647adb592ac9d078192fb998036da48b';
//   static Uri uri = Uri.parse(url);
//   List<NowPlayingMoviesData> nowPlayingMoviesList = [];
//   Future<List<NowPlayingMoviesData>?> getMovie() async {
//     try {
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final body = json.decode(response.body);
//         NowPlayingMoviesData nowPlayingMoviesData =
//             NowPlayingMoviesData.fromJson(body);
//         nowPlayingMoviesList.add(nowPlayingMoviesData);
//       }
//       return nowPlayingMoviesList;
//     } catch (e) {
//       // ignore: avoid_print
//       print('error');
//       return null;
//     }
//   }
// }
