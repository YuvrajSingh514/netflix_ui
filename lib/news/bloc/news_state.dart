part of 'news_bloc.dart';


sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsLoadedState extends NewsState {
  final List<NewsData> newsList;

  NewsLoadedState({required this.newsList});



}

final class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState({required this.error});


}
