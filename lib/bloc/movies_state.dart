part of 'movies_bloc.dart';


sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState{}

final class MoviesLoadedState extends MoviesState{}

final class MoviesErrorState extends MoviesState{}
