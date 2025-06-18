part of 'hot_news_bloc.dart';


sealed class HotNewsState {}

final class HotNewsInitial extends HotNewsState {}


final class HotNewsLoadingState extends HotNewsState {}

final class HotNewsLoadedState extends HotNewsState {
  final List<HotNewsData> hotNewsList;

  HotNewsLoadedState({required this.hotNewsList});

}

final class HotNewsErrorState extends HotNewsState {
  final String error;

  HotNewsErrorState({required this.error});
}

