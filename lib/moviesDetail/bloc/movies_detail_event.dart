part of 'movies_detail_bloc.dart';

sealed class MoviesDetailEvent {}

class GetMoviesDetailList extends MoviesDetailEvent {
  final int movieId;

  GetMoviesDetailList({required this.movieId});
}
