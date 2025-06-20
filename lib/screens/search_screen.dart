import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/searchMovie/bloc/search_movie_bloc.dart';
import 'package:movies_app/searchMovie/widget/search_movie_list_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchMovieController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoSearchTextField(
                controller: _searchMovieController,
                prefixIcon: Icon(CupertinoIcons.search, color: Colors.black),
                suffixIcon: Icon(Icons.cancel, color: Colors.black),
                backgroundColor: Colors.grey,
                style: TextStyle(color: Colors.black),
                onSubmitted: (query) {
                  context.read<SearchMovieBloc>().add(
                    GetSearchMovieList(query: query),
                  );
                },
              ),
            ),
            SizedBox(
              height: 300,
              child: SearchMovieListView(query: _searchMovieController.text),
            ),
          ],
        ),
      ),
    );
  }
}
