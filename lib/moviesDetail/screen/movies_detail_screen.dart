import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/bloc/movies_detail_bloc.dart';

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
          return SafeArea(
            child: Column(
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
              ],
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
