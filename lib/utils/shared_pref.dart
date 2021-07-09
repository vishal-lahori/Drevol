import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  setBoolToSF(String name, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(name, value);
  }

  getBoolValuesSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return bool
    bool boolValue = prefs.getBool(name) ?? false;
    return boolValue;
  }

  removeValues(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }

  clearValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
