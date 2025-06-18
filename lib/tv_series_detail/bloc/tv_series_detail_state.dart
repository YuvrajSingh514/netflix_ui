part of 'tv_series_detail_bloc.dart';


sealed class TvSeriesDetailState {}

final class TvSeriesDetailInitial extends TvSeriesDetailState {}

final class TvSeriesDetailLoadingState extends TvSeriesDetailState {}

final class TvSeriesDetailLoadedState extends TvSeriesDetailState {
  final TvSeriesDetailModel tvSeriesDetailList;
  TvSeriesDetailLoadedState({required this.tvSeriesDetailList});
}

final class TvSeriesDetailErrorState extends TvSeriesDetailState {
  final String error;
  TvSeriesDetailErrorState({required this.error});
}
