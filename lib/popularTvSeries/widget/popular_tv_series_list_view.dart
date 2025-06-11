import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/image_url.dart';
import 'package:movies_app/popularTvSeries/bloc/popular_tv_series_bloc.dart';

class PopularTvSeriesListView extends StatelessWidget {
  const PopularTvSeriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PopularTvSeriesBloc>(context).add(GetPopularTvSeriesList());
    return BlocBuilder(
      bloc: BlocProvider.of<PopularTvSeriesBloc>(context),
      builder: (context, state) {
        if (state is PopularTvSeriesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PopularTvSeriesLoadedState) {
          return ListView.separated(
            itemCount: state.popularTvSeriesList.length,
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
                        '$imageUrl${state.popularTvSeriesList[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 2),
          );
        } else if (state is PopularTvSeriesErrorState) {
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
