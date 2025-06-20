import 'package:flutter/material.dart';
import 'package:movies_app/news/widget/news_list_view.dart';

class HotNewsScreen extends StatelessWidget {
  const HotNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hot News',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: NewsListView(),
    );
  }
}
