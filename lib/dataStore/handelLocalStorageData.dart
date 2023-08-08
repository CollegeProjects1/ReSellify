import 'package:shared_preferences/shared_preferences.dart';

dynamic getLocalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // print(prefs.getString("token"));
  String? token = prefs.getString("token");
  // return prefs.getString("token");
  return token;
}

dynamic setLocalData(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setString(key, value);
}

dynamic getLocalFataByKey(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString(key);
  return await token;
}
