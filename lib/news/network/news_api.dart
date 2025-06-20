import 'dart:convert';

import 'package:movies_app/news/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static String url =
      'https://api.themoviedb.org/3/trending/all/day?api_key=647adb592ac9d078192fb998036da48b';

  static Future<NewsModel> getNews() async {
    NewsModel newsModel = NewsModel();

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      newsModel = NewsModel.fromJson(body);
    }
    return newsModel;
  }
}
