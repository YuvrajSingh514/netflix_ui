import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/screen/movies_detail_screen.dart';
import 'package:movies_app/searchMovie/bloc/search_movie_bloc.dart';

class SearchMovieListView extends StatelessWidget {
  final String query;
  const SearchMovieListView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchMovieBloc>(
      context,
    ).add(GetSearchMovieList(query: query));
    return BlocBuilder(
      bloc: BlocProvider.of<SearchMovieBloc>(context),
      builder: (context, state) {
        if (state is SearchMovieLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchMovieLoadedState) {
          return ListView.builder(
            itemCount: state.searchMovieList.length,
            itemBuilder: (context, index) {
              //final searchMovie = state.searchMovieList[index];
              return ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MoviesDetailScreen(
                              movieId: state.searchMovieList[index].id ?? 0,
                            ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    child: Image(
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.searchMovieList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
                title: Text(
                  state.searchMovieList[index].title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  state.searchMovieList[index].overview!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
              );
            },
          );
        } else if (state is SearchMovieErrorState) {
          return Text(
            state.error,
            style: TextStyle(fontSize: 20, color: Colors.white),
          );
        }
        return Text(
          'Type something to search',
          style: TextStyle(fontSize: 18, color: Colors.white),
        );
      },
    );
  }
}
