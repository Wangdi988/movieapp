import 'package:api_consume_application/model/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigMovieCard extends StatelessWidget{
  MovieModel movie;
  BigMovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        height:200,
        width:300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              fit: BoxFit.cover,
            image:  NetworkImage(movie.img)
          ),
        ),
        margin: EdgeInsets.only(right: 8),
        alignment: Alignment.bottomLeft,
        child: Container(
          width: double.infinity,
          color:Colors.black,
          padding: EdgeInsets.all(8),
          child: Text(movie.title, style: TextStyle(
            color: Colors.white
          ),),

        ),
      ),
    );
  }
}