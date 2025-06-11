import 'package:bloc/bloc.dart';

import 'package:movies_app/popularTvSeries/model/popular_tv_series_model.dart';
import 'package:movies_app/popularTvSeries/network/popular_tv_series_api_service.dart';

part 'popular_tv_series_event.dart';
part 'popular_tv_series_state.dart';

class PopularTvSeriesBloc
    extends Bloc<PopularTvSeriesEvent, PopularTvSeriesState> {
  PopularTvSeriesApiService popularTvSeriesApiService =
      PopularTvSeriesApiService();
  PopularTvSeriesBloc() : super(PopularTvSeriesInitial()) {
     on<GetPopularTvSeriesList>(onGetPopularTvSeriesList);
  }
  onGetPopularTvSeriesList(
    GetPopularTvSeriesList event,
    Emitter<PopularTvSeriesState> state,
  ) async {
    emit(PopularTvSeriesLoadingState());
    try {
      PopularTvSeriesModel? popularTvSeriesModel =
          await popularTvSeriesApiService.getPopularTvSeries();
      if (popularTvSeriesModel?.popularTvSeriesList != null &&
          (popularTvSeriesModel?.popularTvSeriesList?.isNotEmpty ?? false)) {
        emit(
          PopularTvSeriesLoadedState(
            popularTvSeriesList: popularTvSeriesModel!.popularTvSeriesList!,
          ),
        );
      } else {
        emit(PopularTvSeriesErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(PopularTvSeriesErrorState(error: 'Something Went Wrong'));
    }
  
  }
  }

