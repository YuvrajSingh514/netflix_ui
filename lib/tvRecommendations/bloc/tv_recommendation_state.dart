part of 'tv_recommendation_bloc.dart';


sealed class TvRecommendationState {}

final class TvRecommendationInitial extends TvRecommendationState {}

final class TvRecommendationLoadingState extends TvRecommendationState {}

final class  TvRecommendationLoadedState extends TvRecommendationState {
  final List<TvRecommendationsData?>? tvRecommendationsList;

  TvRecommendationLoadedState({required this.tvRecommendationsList});

 

}

final class TvRecommendationErrorState extends TvRecommendationState {
  final String error;

  TvRecommendationErrorState({required this.error});



 
}

