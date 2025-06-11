import 'package:bloc/bloc.dart';

import 'package:movies_app/topRatedMovies/model/top_rated_movies_model.dart';
import 'package:movies_app/topRatedMovies/network/top_rated_movies_api_service.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  TopRatedMoviesApiService topRatedMoviesApiService =
      TopRatedMoviesApiService();
  TopRatedMoviesBloc() : super(TopRatedMoviesInitial()) {
     on<GetTopRatedMoviesList>(onGetTopRatedMoviesList);
  }
  onGetTopRatedMoviesList(
    GetTopRatedMoviesList event,
    Emitter<TopRatedMoviesState> state,
  ) async {
    emit(TopRatedMoviesLoadingState());
    try {
      TopRatedMoviesModel? topRatedMoviesModel =
          await topRatedMoviesApiService.getTopRatedMovies();
      if (topRatedMoviesModel?.topRatedMoviesList != null &&
          (topRatedMoviesModel?.topRatedMoviesList?.isNotEmpty ?? false)) {
        emit(
          TopRatedMoviesLoadedState(
            topRatedMoviesList: topRatedMoviesModel!.topRatedMoviesList!,
          ),
        );
      } else {
        emit(TopRatedMoviesErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(TopRatedMoviesErrorState(error: 'Something Went Wrong'));
    }
  
  }
}
