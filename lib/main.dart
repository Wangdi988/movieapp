import 'package:api_consume_application/hoc/home_layout.dart';
import 'package:api_consume_application/provider/count_provider.dart';
import 'package:api_consume_application/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   home: HomeLayout()
    // );

    return MultiProvider(
      providers: [
        // providers should be categorized well to keep track and separate
        // all the modules and their respective variables
        ChangeNotifierProvider(create: (context)=> CountProvider()),
        ChangeNotifierProvider(create: (context)=> MovieProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        // home: HomeMovieScreen(),
        initialRoute: '/',
        routes: {
          '/': (context)=> HomeLayout(),
          // '/trending': (context)=> TrendingMovieScreen(),
          // '/categories': (context)=> CategoriesMovieScreen(),
        }
      ),
    );
  }
}