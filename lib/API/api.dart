import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<dynamic, dynamic>> getCategories() async {
  var responses = {};
  final res = await http.get(
    Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"),
  );

  if (res.statusCode == 200) {
    final jsonRes = jsonDecode(res.body);
    responses = jsonRes;
  }

  return responses;
}

Future<Map<dynamic, dynamic>> getSpecificCategories(String category) async {
  var responses = {};
  var uri = "https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}";
  final res = await http.get(
    Uri.parse(uri),
  );

  if (res.statusCode == 200) {
    final jsonRes = jsonDecode(res.body);
    responses = jsonRes;
  }
  return responses;
}

Future<Map<dynamic, dynamic>> searchCuisine(String name) async {
  var responses = {};
  var uri = "http://www.themealdb.com/api/json/v1/1/search.php?s=${name}";
  final res = await http.get(
    Uri.parse(uri),
  );

  if (res.statusCode == 200) {
    final jsonRes = jsonDecode(res.body);
    responses = jsonRes;
  }
  return responses;
}

Future<Map<dynamic, dynamic>> searchById(String id) async {
  var responses = {};
  var uri = "http://www.themealdb.com/api/json/v1/1/lookup.php?i=${id}";
  final res = await http.get(
    Uri.parse(uri),
  );

  if (res.statusCode == 200) {
    final jsonRes = jsonDecode(res.body);
    responses = jsonRes;
  }
  return responses;
}
