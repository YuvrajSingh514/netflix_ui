import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/hot_new_screen.dart';
import 'package:movies_app/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 60,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.photo_library_outlined), text: 'Hot&New'),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [HomeScreen(), SearchScreen(), HotNewScreen()],
        ),
      ),
    );
  }
}
