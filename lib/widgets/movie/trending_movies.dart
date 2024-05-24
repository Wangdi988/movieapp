import 'package:api_consume_application/provider/movie_provider.dart';
import 'package:api_consume_application/widgets/movie/movie_card/big_movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TrendingMovies extends StatelessWidget{
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final trending = Provider.of<MovieProvider>(context).trending;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tranding', style: TextStyle(fontSize: 20),),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                // BigMovieCard()
              children: trending.map((el)=>BigMovieCard(el)).toList(),
              
            ),
          ),
        ),
      ],
    );
  }
}