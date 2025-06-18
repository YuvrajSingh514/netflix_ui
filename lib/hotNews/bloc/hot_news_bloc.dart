import 'package:bloc/bloc.dart';

import 'package:movies_app/hotNews/model/hot_news_model.dart';
import 'package:movies_app/hotNews/network/hot_news_api.dart';

part 'hot_news_event.dart';
part 'hot_news_state.dart';

class HotNewsBloc extends Bloc<HotNewsEvent, HotNewsState> {
  HotNewsApi hotNewsApi = HotNewsApi();
  HotNewsBloc() : super(HotNewsInitial()) {
    on<GetHotNewsList>(onGetHotNewsList);
  }
  onGetHotNewsList(
    GetHotNewsList event,
    Emitter<HotNewsState> state,
  ) async {
    emit(HotNewsLoadingState());
    try {
      HotNewsModel? hotNewsModel =
          await hotNewsApi.getHotNewsList();
      if (hotNewsModel?.hotNewsList != null &&
          (hotNewsModel?.hotNewsList?.isNotEmpty ?? false)) {
        emit(
          HotNewsLoadedState(
            hotNewsList: hotNewsModel!.hotNewsList!,
          ),
        );
      } else {
        emit(HotNewsErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(HotNewsErrorState(error: 'Something Went Wrong'));
    }
  }
}
