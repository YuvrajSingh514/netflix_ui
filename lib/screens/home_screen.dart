import 'package:flutter/material.dart';
import 'package:movies_app/popularTvSeries/widget/popular_tv_series_list_view.dart';
import 'package:movies_app/screens/search_screen.dart';
import 'package:movies_app/topRatedMovies/widget/top_rated_movies_list_view.dart';
import 'package:movies_app/trendingMovies/widget/trending_movies_list_view.dart';
import 'package:movies_app/upcomingMovies/widget/upcoming_movies_list_view.dart';
import 'package:movies_app/widgets/home_screen_button.dart';
import 'package:movies_app/nowPlayingMovies/widget/now_playing_movies_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 0, right: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/netflix logo.png', height: 35),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.search_sharp, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      HomeScreenButton(text: 'Tv Shows'),
                      SizedBox(width: 10),
                      HomeScreenButton(text: 'Movies'),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 400,
                    child: NowPlayingMoviesPageView(),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Upcoming Movies',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(height: 110, child: UpcomingMoviesListView()),
                ),
                SizedBox(height: 10),
                Text(
                  'Trending Movies',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(height: 110, child: TrendingMoviesListView()),
                ),
                SizedBox(height: 10),
                Text(
                  'Top Rated Movies - Must Watch',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(height: 110, child: TopRatedMoviesListView()),
                ),
                SizedBox(height: 10),
                Text(
                  'Popular Tv Series',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 110,
                    child: PopularTvSeriesListView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
