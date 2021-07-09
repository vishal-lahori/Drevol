import 'dart:convert';

import 'package:drevol/screens/login_screen.dart';
import 'package:drevol/utils/appUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenProvider extends ChangeNotifier {
  // Users List
  List usersList = [];

  List filteredUsersList = [];

  List addIDList = [];

  List searchedList = [];

  bool noSearchData = false;
  bool isLoading = false;

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);

    usersList.clear();
    usersList = data["users"];

    filteredUsersList.clear();

    usersList.forEach((element) {
      Map<String, dynamic> usersMap = {};

      usersMap["username"] = element["username"];
      usersMap["email"] = element["email"];
      usersMap["city"] = element["city"];

      List contactList = element["contact_numbers"];

      contactList.asMap().entries.forEach((element) {
        if (element.value["contact_type"] == "Primary") {
          usersMap["primary"] = element.value["contact_no"];
        }
      });

      List productIDList = element["favourite_products"];

      addIDList.clear();
      productIDList.asMap().entries.forEach((element) {
        addIDList.add(element.value["product_id"]);
      });

      usersMap["productIDs"] = addIDList.toString();

      filteredUsersList.add(usersMap);
    });

    Future.delayed(Duration(seconds: 3)).then((value) {
      isLoading = true;
      notifyListeners();
    });

    notifyListeners();
  }

  // Logout Fun
  void logoutFun() {
    Navigator.pushAndRemoveUntil(
        AppUtils().routeObserver.navigator!.context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);

    AppUtils().mainSharedPref.removeValues("isLoggedIn");
  }

  // Search
  onSearchTextChanged(String text) async {
    searchedList.clear();
    if (text.isEmpty) {
      searchedList = [];
      FocusScope.of(AppUtils().routeObserver.navigator!.context)
          .requestFocus(FocusNode());
      notifyListeners();
    }

    filteredUsersList.forEach((user) {
      if (user["username"].toLowerCase().startsWith(text.toLowerCase()) ||
          user["city"].toLowerCase().startsWith(text.toLowerCase()))
        searchedList.add(user);

      noSearchData = true;
    });

    if (searchedList.length == 0) noSearchData = true;
    notifyListeners();
  }

  // Sort list by name
  void sortByName() {
    print(filteredUsersList);

    filteredUsersList.sort((a, b) {
      var result = a["username"].compareTo(b["username"]);

      return result;
    });

    notifyListeners();
  }
}
