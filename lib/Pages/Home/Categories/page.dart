import 'package:flutter/material.dart';
import 'package:restaurant_flutter/API/api.dart';
import 'package:restaurant_flutter/Pages/Home/contentSection.dart';
import 'package:restaurant_flutter/Pages/Home/page.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Map content = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSpecificCategories(widget.categoryName).then((value) => setState(() {
          content = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 245, 244, 244),
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: [
                Text(widget.categoryName),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePages()));
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ],
                ),
                Expanded(
                    child: content.isNotEmpty
                        ? SingleChildScrollView(
                            child: ContentSection(data: content))
                        : const Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
