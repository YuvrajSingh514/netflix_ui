import 'package:bloc/bloc.dart';

import 'package:movies_app/tvRecommendations/model/tv_recommendation_model.dart';
import 'package:movies_app/tvRecommendations/network/tv_recommendation_api.dart';

part 'tv_recommendation_event.dart';
part 'tv_recommendation_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  TvRecommendationApi tvRecommendationApi = TvRecommendationApi();
  TvRecommendationBloc() : super(TvRecommendationInitial()) {
    on<GetTvRecommendationList>(onGetTvRecommendationList);
  }
  onGetTvRecommendationList(
    GetTvRecommendationList event,
    Emitter<TvRecommendationState> state,
  ) async {
    emit(TvRecommendationLoadingState());
    try {
      TvRecommendationsModel? tvRecommendationsModel =
          await tvRecommendationApi.getTvRecommendation(event.seriesId);

      {
        emit(
          TvRecommendationLoadedState(
            tvRecommendationsList:
                tvRecommendationsModel?.tvRecommendationsList ?? [],
          ),
        );
      }
    } catch (e) {
      emit(TvRecommendationErrorState(error: 'Something Went Wrong'));
    }
  }
}
