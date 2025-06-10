// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:movies_app/nowPlayingMovies/model/now_playing_movies_data.dart';
import 'package:movies_app/nowPlayingMovies/network/now_playing_movies_api.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  NowPlayingMoviesApi nowPlayingMoviesApi = NowPlayingMoviesApi();
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesGetMoviesList>(onGetMoviesList);
  }
  onGetMoviesList(MoviesGetMoviesList event, Emitter<MoviesState> state) async {
    emit(MoviesLoadingState());
    try {
      NowPlayingMoviesData? nowPlayingMoviesData =
          await nowPlayingMoviesApi.getMovie();
      if (nowPlayingMoviesData?.moviesList != null &&
          (nowPlayingMoviesData?.moviesList?.isNotEmpty ?? false)) {
        emit(
         MoviesLoadedState(moviesList: nowPlayingMoviesData!.moviesList!)
        );
      } else {
        emit(MoviesErrorState(error: 'data not available'));
      }
    } catch (e) {
      emit(MoviesErrorState(error: 'Something Went Wrong'));
    }
  }
}
