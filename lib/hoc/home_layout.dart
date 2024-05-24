import 'package:api_consume_application/screen/movie/movie_categories_screen.dart';
import 'package:api_consume_application/screen/movie/movie_home_screen.dart';
import 'package:api_consume_application/screen/movie/movie_trending_screen.dart';
import 'package:api_consume_application/screen/movie/trending_movie_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget{
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>{
  int _index = 0;
  List<String> titles = ['Home', 'Trending', 'Categories'];
  List<Widget> screens = [
    MovieHomeScreen(),
    // MovieTrendingScreen(),
    TrendingMovieScreen(),
    MovieCategoriesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(titles[_index], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),

      body: SingleChildScrollView(
        child: screens[_index]
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (val){
          setState(() {
            _index = val;
          });
        },
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Trending'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Categories')
        ],
        ),
    );
  }
}