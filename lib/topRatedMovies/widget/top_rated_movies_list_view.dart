import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/topRatedMovies/bloc/top_rated_movies_bloc.dart';


class TopRatedMoviesListView extends StatelessWidget {
  const TopRatedMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TopRatedMoviesBloc>(context).add(GetTopRatedMoviesList());
    return BlocBuilder(
      bloc: BlocProvider.of<TopRatedMoviesBloc>(context),
      builder: (context, state) {
        if (state is TopRatedMoviesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TopRatedMoviesLoadedState) {
          return ListView.separated(
            itemCount: state.topRatedMoviesList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {} ,
                child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.topRatedMoviesList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is TopRatedMoviesErrorState) {
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
