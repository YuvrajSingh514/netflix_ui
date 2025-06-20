import 'package:bloc/bloc.dart';

import 'package:movies_app/news/model/news_model.dart';
import 'package:movies_app/news/network/news_api.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsApi newsApi = NewsApi();
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsList>(onGetNewsList);
  }
  onGetNewsList(GetNewsList event, Emitter<NewsState> state) async {
    emit(NewsLoadingState());
    try {
      NewsModel? newsModel = await NewsApi.getNews();
      if (newsModel.newsList != null &&
          (newsModel.newsList!.isNotEmpty)) {
        emit(NewsLoadedState(newsList: newsModel.newsList!));
      } else {
        emit(NewsErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(NewsErrorState(error: 'Something Went Wrong'));
    }
  }
}
