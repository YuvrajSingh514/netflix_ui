part of 'search_movie_bloc.dart';

sealed class SearchMovieState {}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoadingState extends SearchMovieState {}

final class SearchMovieLoadedState extends SearchMovieState {
  final List<SearchMovieData> searchMovieList;

  SearchMovieLoadedState({required this.searchMovieList});

 
}

final class SearchMovieErrorState extends SearchMovieState {
  final String error;

  SearchMovieErrorState({required this.error});


}
