import 'package:bloc/bloc.dart';

import 'package:movies_app/MoviesRecomendation/model/movies_recommendation_model.dart';
import 'package:movies_app/MoviesRecomendation/network/movies_recommendation_api.dart';

part 'movies_recommendation_event.dart';
part 'movies_recommendation_state.dart';

class MoviesRecommendationBloc
    extends Bloc<MoviesRecommendationEvent, MoviesRecommendationState> {
  MoviesRecommendationApi moviesRecommendationApi = MoviesRecommendationApi();
  MoviesRecommendationBloc() : super(MoviesRecommendationInitial()) {
    on<GetMoviesRecommendationList>(onGetMoviesRecommendationList);
  }
  onGetMoviesRecommendationList(
    GetMoviesRecommendationList event,
    Emitter<MoviesRecommendationState> state,
  ) async {
    emit(MoviesRecommendationLoadingState());
    try {
       MoviesRecommendationModel? moviesRecommendationModel =
          await moviesRecommendationApi.getMoviesRecommendation(event.movieId);
        
      {
        emit(
          MoviesRecommendationLoadedState(
            moviesRecommendationList: moviesRecommendationModel?.moviesRecommendationList??[] )
          
        );
      }
    } catch (e) {
      emit(MoviesRecommendationErrorState(error: 'Something Went Wrong'));
    }
  }
}
