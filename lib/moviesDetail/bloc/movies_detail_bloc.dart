import 'package:bloc/bloc.dart';

import 'package:movies_app/moviesDetail/model/movies_detail_model.dart';
import 'package:movies_app/moviesDetail/network/movies_detail_api_service.dart';

part 'movies_detail_event.dart';
part 'movies_detail_state.dart';

class MoviesDetailBloc extends Bloc<MoviesDetailEvent, MoviesDetailState> {
  MoviesDetailApiService moviesDetailApiService = MoviesDetailApiService();
  MoviesDetailBloc() : super(MoviesDetailInitial()) {
    on<GetMoviesDetailList>(onGetMoviesDetailList);
  }
  onGetMoviesDetailList(
    GetMoviesDetailList event,
    Emitter<MoviesDetailState> state,
  ) async {
    emit(MoviesDetailLoadingState());
    try {
      final MoviesDetailModel moviesDetailList = await moviesDetailApiService
          .getMovieDetail(event.movieId);
      {
        emit(MoviesDetailLoadedState(moviesDetailList: moviesDetailList));
      }
    } catch (e) {
      emit(MoviesDetailErrorState(error: 'Something Went Wrong'));
    }
  }
}
