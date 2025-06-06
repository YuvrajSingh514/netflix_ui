import 'package:flutter/material.dart';

class HomeScreenContainer extends StatelessWidget {
  const HomeScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      
      child: Container(
        height: 500,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:  Colors.grey),
        ),
      ),
    );
  }
}
