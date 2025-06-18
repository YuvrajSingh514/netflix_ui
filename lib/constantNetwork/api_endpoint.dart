class ApiEndpoint {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String endPointMovies = 'movie/now_playing';
  static const String upcomingMoviesEndPoint = 'movie/upcoming';
  static const String trendingMovies = 'trending/movie/day';
  static const String topRatedMovies = 'movie/top_rated';
  static const String popularTvSeries = 'tv/popular';
  static String movieDetail(int movieId) => 'movie/$movieId';
  static String tvSeriesDetail(int seriesId) => 'tv/$seriesId';
  static String moviesRecommendation(int movieId) => 'movie/$movieId/recommendations';
  static String tvRecommendation(int seriesId) => 'tv/$seriesId/recommendations';
  static String searchMovie(String query) => 'search/movie?query=$query';


}
