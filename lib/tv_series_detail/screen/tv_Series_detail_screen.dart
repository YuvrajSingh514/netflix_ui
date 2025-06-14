import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';

import 'package:movies_app/tv_series_detail/bloc/tv_series_detail_bloc.dart';

class TvSeriesDetailScreen extends StatelessWidget {
  final int seriesId;
  const TvSeriesDetailScreen({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TvSeriesDetailBloc>(
      context,
    ).add(GetTvSeriesDetailList(seriesId));

    return BlocBuilder(
      bloc: BlocProvider.of<TvSeriesDetailBloc>(context),
      builder: (context, state) {
        if (state is TvSeriesDetailLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TvSeriesDetailLoadedState) {
          return SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            '$imageUrl${state.tvSeriesDetailList.backdropPath}',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      bottom: 100,
                      right: 100,
                      left: 100,
                      child: Icon(
                        Icons.play_circle_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is TvSeriesDetailErrorState) {
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
