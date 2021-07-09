import 'package:drevol/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static final AppUtils _singleton = AppUtils._internal();

  factory AppUtils() {
    return _singleton;
  }
  AppUtils._internal();

  late BuildContext context;
  // Route observer
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  // Shared Pref
  final SharedPref mainSharedPref = SharedPref();
}
