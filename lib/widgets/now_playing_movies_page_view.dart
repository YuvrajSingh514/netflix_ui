import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/movies_bloc.dart';
import 'package:movies_app/constants/image_url.dart';

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
            child: SizedBox(
              height: 520,
              child: PageView.builder(
                itemCount: state.moviesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 400,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "$imageUrl${state.moviesList[index].posterPath}",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
