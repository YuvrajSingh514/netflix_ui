part of 'upcoming_movies_bloc.dart';



sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesLoadingState extends UpcomingMoviesState {}

final class UpcomingMoviesLoadedState extends UpcomingMoviesState {
  final List<UpcomingMoviesData> upcomingMoviesList;
  UpcomingMoviesLoadedState({required this.upcomingMoviesList});
}

final class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final String error;

  UpcomingMoviesErrorState({required this.error});
}
