import 'package:bloc/bloc.dart';

import 'package:movies_app/trendingMovies/model/trending_movies_model.dart';
import 'package:movies_app/trendingMovies/network/trending_movies_api_service.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesApiService trendingMoviesApiService =
      TrendingMoviesApiService();
  TrendingMoviesBloc() : super(TrendingMoviesInitial()) {
    on<GetTrendingMoviesList>(onGetTrendingMoviesList);
  }
  onGetTrendingMoviesList(
    GetTrendingMoviesList event,
    Emitter<TrendingMoviesState> state,
  ) async {
    emit(TrendingMoviesLoadingState());
    try {
      TrendingMoviesModel? trendingMoviesModel =
          await trendingMoviesApiService.getTrendingMovies();
      if (trendingMoviesModel?.trendingMoviesList != null &&
          (trendingMoviesModel?.trendingMoviesList?.isNotEmpty ?? false)) {
        emit(
          TrendingMoviesLoadedState(
            trendingMoviesList: trendingMoviesModel!.trendingMoviesList!,
          ),
        );
      } else {
        emit(TrendingMoviesErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(TrendingMoviesErrorState(error: 'Something Went Wrong'));
    }
  }
}
