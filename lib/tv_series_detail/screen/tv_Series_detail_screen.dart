import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/tvRecommendations/widget/tv_recommendation_list.dart';

import 'package:movies_app/tv_series_detail/bloc/tv_series_detail_bloc.dart';
import 'package:movies_app/widgets/download_elevated_button.dart';
import 'package:movies_app/widgets/play_elevated_button.dart';

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
                 Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 0,
                      top: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                state.tvSeriesDetailList.name ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Image.asset('assets/logo2.png', height: 30),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              state.tvSeriesDetailList.firstAirDate ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              state.tvSeriesDetailList.originCountry.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'HD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  PlayElevatedButton(),
                  SizedBox(height: 10),
                  DownloadElevatedButton(),
                  SizedBox(height: 10),
                  Text(
                    state.tvSeriesDetailList.overview.toString(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.white54),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.add, size: 35, color: Colors.white),
                          Text(
                            'My List',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.thumb_up_sharp,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share, size: 35, color: Colors.white),
                          Text(
                            'Share',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'More Like This',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TvRecommendationList(seriesId: seriesId),
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
