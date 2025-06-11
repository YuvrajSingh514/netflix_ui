part of 'trending_movies_bloc.dart';


sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoadingState extends TrendingMoviesState {}

final class TrendingMoviesLoadedState extends TrendingMoviesState {
  final List<TrendingMoviesData> trendingMoviesList;

  TrendingMoviesLoadedState({required this.trendingMoviesList});
 
}

final class TrendingMoviesErrorState extends TrendingMoviesState {
  final String error;

  TrendingMoviesErrorState({required this.error});

}
