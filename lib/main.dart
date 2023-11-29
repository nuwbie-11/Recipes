import 'package:flutter/material.dart';
import 'package:restaurant_flutter/Pages/Auth/page.dart';
import 'package:restaurant_flutter/Pages/Home/page.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = prefs.containsKey('auth');
  runApp(MaterialApp(
    home: isLogged ? HomePages() : const Auth(),
  ));
}
