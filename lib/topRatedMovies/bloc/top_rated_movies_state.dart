part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesState {}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesLoadingState extends TopRatedMoviesState {}

final class TopRatedMoviesLoadedState extends TopRatedMoviesState {
  final List<TopRatedMoviesData> topRatedMoviesList;

  TopRatedMoviesLoadedState({required this.topRatedMoviesList});
 
}

final class TopRatedMoviesErrorState extends TopRatedMoviesState {
  final String error;

  TopRatedMoviesErrorState({required this.error});

  
}

