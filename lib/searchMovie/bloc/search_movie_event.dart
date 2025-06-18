part of 'search_movie_bloc.dart';

sealed class SearchMovieEvent {}

class GetSearchMovieList extends SearchMovieEvent {
  final String query;

  GetSearchMovieList({required this.query});
}
