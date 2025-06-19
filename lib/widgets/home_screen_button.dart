// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class HomeScreenButton extends StatelessWidget {
  final String text;

  const HomeScreenButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return MaterialButton(
      onPressed: () {
        _scrollController.animateTo(
          300,
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceIn,
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
