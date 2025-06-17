import 'package:bloc/bloc.dart';

import 'package:movies_app/searchMovie/model/search_movie_model.dart';
import 'package:movies_app/searchMovie/network/search_movie_api.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieApi searchMovieApi = SearchMovieApi();
  SearchMovieBloc() : super(SearchMovieInitial()) {
    on<GetSearchMovieList>(onGetSearchMovieList);
  }
  onGetSearchMovieList(
    GetSearchMovieList event,
    Emitter<SearchMovieState> state,
  ) async {
    emit(SearchMovieLoadingState());
    try {
      SearchMovieModel? searchMovieModel =
          await searchMovieApi.getSearchMovie(event.query);

      {
        emit(
          SearchMovieLoadedState(
            searchMovieList:
                searchMovieModel?.searchMovieList ?? [],
          ),
        );
      }
    } catch (e) {
      emit(SearchMovieErrorState(error: 'Something Went Wrong'));
    }
  }
}
