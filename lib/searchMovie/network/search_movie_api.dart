import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:movies_app/constantNetwork/api_endpoint.dart';
import 'package:movies_app/constantNetwork/network_base.dart';
import 'package:movies_app/searchMovie/model/search_movie_model.dart';

class SearchMovieApi {
  Future<SearchMovieModel?> getSearchMovie(String query) async {
    try {
      final response = await NetworkBase.dio.get(
        ApiEndpoint.searchMovie(query),
        options: Options(headers: {'Connection': 'keep-alive'}),
      );

      if (response.statusCode == 200) {
        return SearchMovieModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
