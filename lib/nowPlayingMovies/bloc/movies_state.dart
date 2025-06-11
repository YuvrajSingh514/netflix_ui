part of 'movies_bloc.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesLoadedState extends MoviesState {
  final List<NowPlayingMoviesModel> moviesList;
  

  MoviesLoadedState({required this.moviesList});
}

final class MoviesErrorState extends MoviesState {
  final String error;

  MoviesErrorState({required this.error});
}
