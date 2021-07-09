import 'package:drevol/screens/home_screen.dart';
import 'package:drevol/utils/appUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  // Form Key
  GlobalKey<FormState> loginEmailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginPasswordFormKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Others
  bool? checkboxValue = false;
  bool? isMasked = false;

  static String staticEmail = "login@email.com";
  static String staticPassword = "login123";

  // Change checkbox value
  void changeCheckBoxValue(bool? value) {
    checkboxValue = value;
    notifyListeners();
  }

  // Change masking
  void changeMasking() {
    isMasked == true ? isMasked = false : isMasked = true;
    notifyListeners();
  }

  // Login Fun
  void loginFun(String email, String password) {
    if (email == staticEmail && password == staticPassword) {
      ScaffoldMessenger.of(AppUtils().routeObserver.navigator!.context)
          .showSnackBar(
        SnackBar(
          content: Text("Login Successfull!"),
        ),
      );

      Navigator.pushAndRemoveUntil(
          AppUtils().routeObserver.navigator!.context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);

      AppUtils().mainSharedPref.setBoolToSF("isLoggedIn", true);
    } else {
      ScaffoldMessenger.of(AppUtils().routeObserver.navigator!.context)
          .showSnackBar(
        SnackBar(
          content: Text("Incorrect Email or Password"),
        ),
      );
    }
  }
}
