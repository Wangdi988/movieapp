import 'package:api_consume_application/widgets/movie/category_list.dart';
import 'package:api_consume_application/widgets/movie/latest_movies.dart';
import 'package:api_consume_application/widgets/movie/trending_movies.dart';
import 'package:flutter/widgets.dart';

class MovieHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      height: MediaQuery.of(context).size.height,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingMovies(),
            CategoryList(),
            LatestMovies()
          ],
        ),
      ),
    );
  }
}