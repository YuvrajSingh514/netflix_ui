

import 'package:flutter/material.dart';
import 'package:movies_app/widgets/home_screen_button.dart';
import 'package:movies_app/widgets/now_playing_movies_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 0, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/netflix logo.png', height: 35),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
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
              SizedBox(
                height: 400,
                child: NowPlayingMoviesPageView()),
            ],
          ),
        ),
      ),
    );
  }
}
