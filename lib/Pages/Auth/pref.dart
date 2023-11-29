import 'package:shared_preferences/shared_preferences.dart';

void setAuth() {
  SharedPreferences.getInstance().then((prefs) => prefs.setBool('auth', true));
  print("Auth is Set");
}
