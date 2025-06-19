import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/hotNews/bloc/hot_news_bloc.dart';
import 'package:movies_app/moviesDetail/screen/movies_detail_screen.dart';


class HotNewsList extends StatelessWidget {
  const HotNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HotNewsBloc>(context).add(GetHotNewsList());
    return BlocBuilder(
      bloc: BlocProvider.of<HotNewsBloc>(context),
      builder: (context, state) {
        if (state is HotNewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HotNewsLoadedState) {
          return ListView.separated(
            itemCount: state.hotNewsList.length,
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
                            movieId: state.hotNewsList[index].id ?? 0,
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageUrl${state.hotNewsList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is HotNewsErrorState) {
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
