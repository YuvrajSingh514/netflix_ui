import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/tvRecommendations/bloc/tv_recommendation_bloc.dart';


class TvRecommendationList extends StatelessWidget {
  final int seriesId;
  const TvRecommendationList({super.key, required this.seriesId, });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TvRecommendationBloc>(
      context,
    ).add(GetTvRecommendationList(seriesId: seriesId));
    return BlocBuilder(
      bloc: BlocProvider.of<TvRecommendationBloc>(context),
      builder: (context, state) {
        if (state is TvRecommendationLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TvRecommendationLoadedState) {
          return ListView.separated(
            itemCount: state.tvRecommendationsList!.length,
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
                        '$imageUrl${state.tvRecommendationsList![index]!.posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is TvRecommendationErrorState) {
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
