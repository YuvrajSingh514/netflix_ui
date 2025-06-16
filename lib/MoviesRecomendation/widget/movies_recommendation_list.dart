import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MoviesRecomendation/bloc/movies_recommendation_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/popularTvSeries/bloc/popular_tv_series_bloc.dart';

class MoviesRecommendationList extends StatelessWidget {
  final int movieId;
  const MoviesRecommendationList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesRecommendationBloc>(
      context,
    ).add(GetMoviesRecommendationList(movieId));
    return BlocBuilder(
      bloc: BlocProvider.of<MoviesRecommendationBloc>(context),
      builder: (context, state) {
        if (state is MoviesRecommendationLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MoviesRecommendationLoadedState) {
          return ListView.separated(
            itemCount: state.moviesRecommendationList!.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.moviesRecommendationList![index]!.posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is MoviesRecommendationErrorState) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        }
        return Container();
      },
    );
  }
}
