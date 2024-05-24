import 'dart:convert';

import 'package:api_consume_application/model/movies_model.dart';
import 'package:api_consume_application/screen/movie/movie_suggestions.dart';
import 'package:flutter/material.dart';
// import 'package:movie/models/movie_model.dart';
// import 'package:movie/providers/movie_provider.dart';
// import 'package:movie/widgets/movies/trending_movies.dart';
import 'package:provider/provider.dart';

// import 'movie_suggestions.dart';
import 'package:http/http.dart' as http;

class MovieCategoryDisplay extends StatefulWidget {
  String category;

  MovieCategoryDisplay({required this.category});

  @override
  State<MovieCategoryDisplay> createState() => _MovieCategoryDisplayState();
}

class _MovieCategoryDisplayState extends State<MovieCategoryDisplay> {
  bool loading = true;
  List<MovieModel> movieSuggestions = [];
  MovieModel movie = MovieModel(
      id: -1, title: 'N/A', description: '', rating: 0, runtime: 0, year: 0);

  @override
  void initState() {
    loadData();
  }

  Future<void> loadData() async {
    await loadMovieDetail();
    // await loadMovieSuggestions();
    setState(() {
      loading = false;
    });
  }

  Future<void> loadMovieDetail() async {
    final res = await http.get(Uri.parse(
        'https://yts.mx/api/v2/movie_details.json?movie_id=' +
            widget.category.toString()));
    // print(jsonDecode(res.body)['data']['movie']);

    final decoded = jsonDecode(res.body)['data']['movie'];
    print(decoded);
    MovieModel temp = MovieModel(
      id: decoded['id'] ?? 0,
      // title: decoded['title'] ?? '',
      title: decoded['title'] ?? '',
      description: decoded['description_intro'] ?? '',
      rating: decoded['rating'] ?? 0,
      runtime: decoded['runtime'] ?? 0,
      year: decoded['year'] ?? 0,
    );

    setState(() {
      movie = temp;
    });
  }


  // Future<void> loadMovieSuggestions() async {
  //   final res = await http.get(Uri.parse(
  //       'https://yts.mx/api/v2/movie_suggestions.json?movie_id=' +
  //           widget.category.toString()));
  //   // print(jsonDecode(res.body)['data']['movies']);
  //   List<MovieModel> tempMovies = [];

  //   for (final movie in jsonDecode(res.body)['data']['movies']) {
  //     tempMovies.add(MovieModel.fromJson(movie));
  //   }

  //   // print(tempMovies);
  //   setState(() {
  //     movieSuggestions = tempMovies;
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title, ),
      // subtitle: Text(movie.year.toString(), style: TextStyle(
      subtitle: Text(
        movie.year.toString(),
        style: TextStyle(),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          movie.img,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
      ),
      trailing: Text(
        movie.rating.toString(),
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
