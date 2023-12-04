import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_flutter/API/api.dart';
import 'package:restaurant_flutter/Pages/Home/page.dart';

class Cuisine extends StatefulWidget {
  Cuisine({Key? key, required this.cuisineId}) : super(key: key);

  final String cuisineId;

  @override
  State<Cuisine> createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
  Map cuisineData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchById(widget.cuisineId).then((value) => setState(() {
          cuisineData = value['meals'][0];
        }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 245, 244, 244),
        child: Column(
          children: [
            cuisineData.isNotEmpty
                ? Column(
                    children: [
                      Container(
                          height: 256,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cuisineData["strMealThumb"]),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePages()));
                                    },
                                    icon: const Icon(Icons.arrow_back)),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                cuisineData['strMeal'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "Listed in ${cuisineData['strCategory']}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(cuisineData['idMeal']),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        "Ingredients",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    for (String key in cuisineData.keys)
                                      if ((key.contains("Ingredient")) &&
                                          (cuisineData[key] != "") &&
                                          (cuisineData[key] != null))
                                        Container(
                                            color: Colors.blue,
                                            child: Text(cuisineData[key]))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        "",
                                      ),
                                    ),
                                    for (String key in cuisineData.keys)
                                      if ((key.contains("Measure")) &&
                                          (cuisineData[key] != "") &&
                                          (cuisineData[key] != null))
                                        Text(cuisineData[key]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 128,
                            height: 128,
                            color: Colors.blue,
                          )
                        ],
                      ))
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
