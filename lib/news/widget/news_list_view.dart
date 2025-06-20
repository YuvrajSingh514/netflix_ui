import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/moviesDetail/screen/movies_detail_screen.dart';
import 'package:movies_app/news/bloc/news_bloc.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(GetNewsList());
    return BlocBuilder(
      bloc: BlocProvider.of<NewsBloc>(context),
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NewsLoadedState) {
          return ListView.separated(
            itemCount: state.newsList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MoviesDetailScreen(
                            movieId: state.newsList[index].id ?? 0,
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.newsList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is NewsErrorState) {
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
