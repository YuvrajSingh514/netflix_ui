import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/screen/movies_detail_screen.dart';
import 'package:movies_app/upcomingMovies/bloc/upcoming_movies_bloc.dart';

class UpcomingMoviesListView extends StatelessWidget {
  const UpcomingMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpcomingMoviesBloc>(context).add(GetUpcomingMoviesList());
    return BlocBuilder(
      bloc: BlocProvider.of<UpcomingMoviesBloc>(context),
      builder: (context, state) {
        if (state is UpcomingMoviesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UpcomingMoviesLoadedState) {
          return ListView.separated(
            itemCount: state.upcomingMoviesList.length,
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
                            movieId: state.upcomingMoviesList[index].id ?? 0,
                          ),
                    ),
                  );
                } ,
                child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.upcomingMoviesList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is UpcomingMoviesErrorState) {
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
