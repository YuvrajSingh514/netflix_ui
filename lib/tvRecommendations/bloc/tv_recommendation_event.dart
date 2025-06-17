part of 'tv_recommendation_bloc.dart';

sealed class TvRecommendationEvent {}

class GetTvRecommendationList extends TvRecommendationEvent {
  final int seriesId;

  GetTvRecommendationList({required this.seriesId});
}
