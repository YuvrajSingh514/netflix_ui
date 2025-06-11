part of 'popular_tv_series_bloc.dart';


sealed class PopularTvSeriesState {}

final class PopularTvSeriesInitial extends PopularTvSeriesState {}

final class PopularTvSeriesLoadingState extends PopularTvSeriesState {}

final class PopularTvSeriesLoadedState extends PopularTvSeriesState {
  final List<PopularTvSeriesData> popularTvSeriesList;

  PopularTvSeriesLoadedState({required this.popularTvSeriesList});
}

final class PopularTvSeriesErrorState extends PopularTvSeriesState {
  final String error;

  PopularTvSeriesErrorState({required this.error});
}