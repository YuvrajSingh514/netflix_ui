// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';

import 'package:movies_app/upcomingMovies/model/upcoming_movies_model.dart';
import 'package:movies_app/upcomingMovies/network/upcoming_movies_service.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesService upcomingMoviesService = UpcomingMoviesService();
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<GetUpcomingMoviesList>(onGetUpcomingMoviesList);
  }
  onGetUpcomingMoviesList(
    GetUpcomingMoviesList event,
    Emitter<UpcomingMoviesState> state,
  ) async {
    emit(UpcomingMoviesLoadingState());
    try {
      UpcomingMoviesModel? upcomingMoviesModel =
          await upcomingMoviesService.getUpcomingMovie();
      if (upcomingMoviesModel?.upcomingMoviesList != null &&
          (upcomingMoviesModel?.upcomingMoviesList?.isNotEmpty ?? false)) {
        emit(
          UpcomingMoviesLoadedState(
            upcomingMoviesList: upcomingMoviesModel!.upcomingMoviesList!,
          ),
        );
      } else {
        emit(UpcomingMoviesErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(UpcomingMoviesErrorState(error: 'Something Went Wrong'));
    }
  }
}
