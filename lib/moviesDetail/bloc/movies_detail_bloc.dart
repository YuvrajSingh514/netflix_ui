// import 'package:bloc/bloc.dart';

// import 'package:movies_app/moviesDetail/model/movies_detail_model.dart';
// import 'package:movies_app/moviesDetail/network/movies_detail_api_service.dart';

// part 'movies_detail_event.dart';
// part 'movies_detail_state.dart';

// class MoviesDetailBloc extends Bloc<MoviesDetailEvent, MoviesDetailState> {
//   MoviesDetailApiService moviesDetailApiService = MoviesDetailApiService();
//   MoviesDetailBloc() : super(MoviesDetailInitial()) {
//    on<GetMoviesDetailList>(onGetMoviesDetailList);
//   }
//   onGetMoviesDetailList(
//     GetMoviesDetailList event,
//     Emitter<MoviesDetailState> state,
//   ) async {
//     emit(MoviesDetailLoadingState());
//     try {
//       List<MoviesDetailModel>? moviesDetailList= await moviesDetailApiService.getMovieDetail(movieId);
//       if (moviesDetailList!= null && (moviesDetailList.isNotEmpty)) {
//         emit(
//           MoviesDetailLoadedState(moviesDetailList: moviesDetailList)
//         );
//       } else {
//         emit(MoviesDetailErrorState(error: 'Data Not Available'));
//       }
//     } catch (e) {
//       emit(MoviesDetailErrorState(error: 'Something Went Wrong'));
//     }
  
//   }
//   }
  
