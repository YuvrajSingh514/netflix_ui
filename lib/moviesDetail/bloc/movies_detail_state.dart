part of 'movies_detail_bloc.dart';

sealed class MoviesDetailState {}

final class MoviesDetailInitial extends MoviesDetailState {}

final class MoviesDetailLoadingState extends MoviesDetailState {}

final class MoviesDetailLoadedState extends MoviesDetailState {
  final MoviesDetailModel moviesDetailList;

  MoviesDetailLoadedState({required this.moviesDetailList});
}

final class MoviesDetailErrorState extends MoviesDetailState {
  final String error;

  MoviesDetailErrorState({required this.error});
}