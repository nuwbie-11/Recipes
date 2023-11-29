import 'package:flutter/material.dart';
import 'package:restaurant_flutter/Components/card.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 12,
            children: [
              for (var category in data.values.elementAt(0))
                Cards(
                  data: category,
                  cases: data.containsKey('meals') ? 1 : 0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
