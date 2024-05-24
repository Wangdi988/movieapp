// import 'package:flutter/material.dart';

// class MovieCategoriesScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 17),
//       height: MediaQuery.of(context).size.height,

//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("Categories")
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:api_consume_application/provider/movie_provider.dart';
import 'package:api_consume_application/widgets/movie/movie_by_category_screen.dart';
import 'package:api_consume_application/widgets/movie/movie_category_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MovieCategoriesScreen extends StatelessWidget{
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
                        child: Column(
                          children: [
                            Container(
                              child: Text(cat)
                            ),

                            Container(
                              margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Latest Movies', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),

          Container(
            child: MovieCategoryDisplay(category: cat),
          )
          // ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     // itemCount: movieList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return MovieCategoryDisplay(category: cat);
          //     }),
        ],
      ),
                            )
                          ],
                        ),
                      ),
                ))
                .toList(),
          )
        ],
      ),
    );
  }
}