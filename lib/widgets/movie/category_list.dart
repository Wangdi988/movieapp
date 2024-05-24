import 'package:api_consume_application/provider/movie_provider.dart';
import 'package:api_consume_application/widgets/movie/movie_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<MovieProvider>(context).categories;
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Wrap(
            children: categories
                .map((cat) => GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieByCategoryScreen(category: cat,)));
              },
                  child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            )),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        margin: EdgeInsets.only(right: 4, bottom: 4),
                        child: Text(cat),
                      ),
                ))
                .toList(),
          )
        ],
      ),
    );
  }
}