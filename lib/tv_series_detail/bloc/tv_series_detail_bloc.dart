import 'package:bloc/bloc.dart';
import 'package:movies_app/tv_series_detail/model/tv_series_detail_model.dart';
import 'package:movies_app/tv_series_detail/network/tv_series_detail_api_service.dart';

part 'tv_series_detail_event.dart';
part 'tv_series_detail_state.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  TvSeriesDetailApiService tvSeriesDetailApiService =
      TvSeriesDetailApiService();
  TvSeriesDetailBloc() : super(TvSeriesDetailInitial()) {
    on<GetTvSeriesDetailList>(onGetTvSeriesDetailList);
  }
  onGetTvSeriesDetailList(
    GetTvSeriesDetailList event,
    Emitter<TvSeriesDetailState> state,
  ) async {
    emit(TvSeriesDetailLoadingState());
    try {
      final TvSeriesDetailModel tvSeriesDetailList = await tvSeriesDetailApiService.getTvSeriesDetail(event.seriesId);
      {
        emit(TvSeriesDetailLoadedState(tvSeriesDetailList: tvSeriesDetailList));
      }
    } catch (e) {
      emit(TvSeriesDetailErrorState(error: 'Something Went Wrong'));
    }
  }
}
