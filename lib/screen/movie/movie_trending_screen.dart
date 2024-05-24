import 'package:flutter/material.dart';

class MovieTrendingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      height: MediaQuery.of(context).size.height,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Trending")
          ],
        ),
      ),
    );
  }
}