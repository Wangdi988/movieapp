import 'dart:convert';
import 'package:api_consume_application/model/movies_model.dart';
import 'package:api_consume_application/widgets/movie/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MovieByCategoryScreen extends StatefulWidget{
  final String category;
  const MovieByCategoryScreen({super.key, required this.category});

  State<MovieByCategoryScreen> createState() => _MovieByCategoryScreenState();
}

class _MovieByCategoryScreenState extends State<MovieByCategoryScreen>{
  List<MovieModel> movieList = [];
  bool loading = true;

  @override
  void initState() {
    loadMoviesByCategory();
  }

  Future<void> loadMoviesByCategory() async {
    final res = await http.get(Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?genre=' + widget.category));
    // decode data before use
    // print(jsonDecode(res.body)['data']['movies']);
    List<MovieModel> tempMovies = [];

    // looping for it to fit in MovieModel format
    for (final movie in jsonDecode(res.body)['data']['movies']) {
      tempMovies.add(MovieModel.fromJson(movie));
    }

    setState(() {
      movieList = tempMovies;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: movieList.length == 0
                  ? Center(
                      child: Text('No movies available for this category'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieTile(movie: movieList[index]);
                        
                      }),
            ),
    );
  }
}