import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/screen/movies_detail_screen.dart';
import 'package:movies_app/nowPlayingMovies/bloc/movies_bloc.dart';

class NowPlayingMoviesPageView extends StatelessWidget {
  const NowPlayingMoviesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesBloc>(context).add(MoviesGetMoviesList());
    return BlocBuilder(
      bloc: BlocProvider.of<MoviesBloc>(context),
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MoviesLoadedState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              itemCount: state.moviesList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MoviesDetailScreen(
                            movieId: state.moviesList[index].id ?? 0,
                          ),
                    ),
                  );
                  },
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.pink,
                    child: Container(
                      height: 400,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                          
                          image: CachedNetworkImageProvider(
                            "$imageUrl${state.moviesList[index].posterPath}",
                          ),
                        ),
                      ),
                      
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is MoviesErrorState) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          );
        }
        return Container();
      },
    );
  }
}
