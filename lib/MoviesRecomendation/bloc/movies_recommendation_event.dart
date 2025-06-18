part of 'movies_recommendation_bloc.dart';

sealed class MoviesRecommendationEvent {}

class GetMoviesRecommendationList extends MoviesRecommendationEvent {
  final int movieId;

  GetMoviesRecommendationList(this.movieId);
}
