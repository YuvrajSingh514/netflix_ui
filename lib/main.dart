import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/nowPlayingMovies/bloc/movies_bloc.dart';
import 'package:movies_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<MoviesBloc>(create: (context) => MoviesBloc())],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.black),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
