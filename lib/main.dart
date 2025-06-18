import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MoviesRecomendation/bloc/movies_recommendation_bloc.dart';
import 'package:movies_app/moviesDetail/bloc/movies_detail_bloc.dart';

import 'package:movies_app/nowPlayingMovies/bloc/movies_bloc.dart';
import 'package:movies_app/popularTvSeries/bloc/popular_tv_series_bloc.dart';
import 'package:movies_app/screens/splash_screen.dart';
import 'package:movies_app/topRatedMovies/bloc/top_rated_movies_bloc.dart';
import 'package:movies_app/trendingMovies/bloc/trending_movies_bloc.dart';
import 'package:movies_app/tvRecommendations/bloc/tv_recommendation_bloc.dart';
import 'package:movies_app/tv_series_detail/bloc/tv_series_detail_bloc.dart';
import 'package:movies_app/upcomingMovies/bloc/upcoming_movies_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(create: (context)=> MoviesBloc()),
        BlocProvider<UpcomingMoviesBloc>(create: (context)=> UpcomingMoviesBloc()),
        BlocProvider<TrendingMoviesBloc>(create: (context)=> TrendingMoviesBloc()),
        BlocProvider<TopRatedMoviesBloc>(create: (context)=> TopRatedMoviesBloc()),
        BlocProvider<PopularTvSeriesBloc>(create: (context)=>PopularTvSeriesBloc()),
        BlocProvider<MoviesDetailBloc>(create: (context)=> MoviesDetailBloc()),
        BlocProvider<TvSeriesDetailBloc>(create: (context)=> TvSeriesDetailBloc()),
        BlocProvider<MoviesRecommendationBloc>(create: (context)=> MoviesRecommendationBloc()),
        BlocProvider<TvRecommendationBloc>(create: (context)=> TvRecommendationBloc()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.black),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
