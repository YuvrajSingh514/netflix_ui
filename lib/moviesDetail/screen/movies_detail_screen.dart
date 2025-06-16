import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MoviesRecomendation/widget/movies_recommendation_list.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/bloc/movies_detail_bloc.dart';
import 'package:movies_app/widgets/download_elevated_button.dart';
import 'package:movies_app/widgets/play_elevated_button.dart';

class MoviesDetailScreen extends StatelessWidget {
  final int movieId;
  const MoviesDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesDetailBloc>(
      context,
    ).add(GetMoviesDetailList(movieId: movieId));
    return BlocBuilder(
      bloc: BlocProvider.of<MoviesDetailBloc>(context),
      builder: (context, state) {
        if (state is MoviesDetailLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MoviesDetailLoadedState) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              '$imageUrl${state.moviesDetailList.backdropPath}',
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
                  //SizedBox(height: 15),
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
                                state.moviesDetailList.title ?? '',
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
                              state.moviesDetailList.releaseDate ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              state.moviesDetailList.runtime.toString(),
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
                    state.moviesDetailList.genres.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.white70),
                  ),

                  Text(
                    state.moviesDetailList.overview.toString(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.white54),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  MoviesRecommendationList(movieId: movieId),
                ],
              ),
            ),
          );
        } else if (state is MoviesDetailErrorState) {
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
