part of 'tv_series_detail_bloc.dart';

sealed class TvSeriesDetailEvent {}

class GetTvSeriesDetailList extends TvSeriesDetailEvent {
  final int seriesId;

  GetTvSeriesDetailList(this.seriesId);
}
