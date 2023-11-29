import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:restaurant_flutter/Pages/Home/Categories/page.dart';
import 'package:restaurant_flutter/API/api.dart';
import 'package:restaurant_flutter/Pages/Recipe/page.dart';

class Cards extends StatelessWidget {
  Cards({
    Key? key,
    this.imgTarget = const ["strCategoryThumb", "strMealThumb"],
    this.labelTarget = const ["strCategory", "strMeal"],
    required this.data,
    this.cases = 0,
  }) : super(key: key);

  final dynamic data;
  final int cases;
  dynamic imgTarget;
  dynamic labelTarget;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          switch (cases) {
            case 0:
              imgTarget = 'strCategoryThumb';
              labelTarget = 'strCategory';
              // print("Tapped on ${data[labelTarget]} Category");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Categories(
                    categoryName: data[labelTarget],
                  ),
                ),
              );
              break;
            case 1:
              imgTarget = 'strMealThumb';
              labelTarget = 'strMeal';
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cuisine(
                        cuisineId: data['idMeal'],
                      )));
              // print("Tapped on ${data[labelTarget]} Meals ${data['idMeal']}");

              break;
            default:
          }
        },
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              right: 12,
              left: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(data[imgTarget[cases]]),
                  width: 128,
                  height: 128,
                ),
                SizedBox(
                  width: 128,
                  child: Text(data[labelTarget[cases]]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
