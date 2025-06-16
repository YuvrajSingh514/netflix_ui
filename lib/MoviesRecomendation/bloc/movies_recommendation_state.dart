part of 'movies_recommendation_bloc.dart';

sealed class MoviesRecommendationState {}

final class MoviesRecommendationInitial extends MoviesRecommendationState {}

final class MoviesRecommendationLoadingState extends MoviesRecommendationState {}

final class MoviesRecommendationLoadedState extends MoviesRecommendationState {
  final List<MoviesRecommendationData?>? moviesRecommendationList;

  MoviesRecommendationLoadedState({required this.moviesRecommendationList});

}

final class MoviesRecommendationErrorState extends MoviesRecommendationState {
  final String error;

  MoviesRecommendationErrorState({required this.error});

 
}
