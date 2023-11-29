import 'package:flutter/material.dart';
import 'package:restaurant_flutter/Components/myTextField.dart';
import 'package:restaurant_flutter/API/api.dart';
import 'package:restaurant_flutter/Pages/Home/contentSection.dart';

class HomePages extends StatefulWidget {
  HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Map data = {};
  final filterController = TextEditingController();

  String _category = "";
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories().then((value) => setState(() {
          data = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            color: Color.fromARGB(255, 245, 244, 244),
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      hint: "Search Cuisine",
                      controller: filterController,
                      onChanged: (value) {
                        setState(() {
                          isLoading = true;
                        });
                        if (value == "") {
                          getCategories().then((value) => setState(() {
                                data = value;
                              }));
                        } else {
                          searchCuisine(value.toString())
                              .then((res) => setState(() {
                                    data = res;
                                  }));
                        }
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      }),
                  Expanded(
                    child: SingleChildScrollView(
                      child: data['categories'] != null ||
                              data['meals'] != null && isLoading == false
                          ? ContentSection(data: data)
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}



// Container(
//         color: const Color.fromARGB(255, 239, 239, 244),
//         child: data.containsKey('categories')
//             ? Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [],
//                   ),
//                   Expanded(
//                     child: CategoriesList(data: data),
//                   ),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),