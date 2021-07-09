import 'package:drevol/config/provider_states.dart';
import 'package:drevol/screens/home_screen.dart';
import 'package:drevol/screens/login_screen.dart';
import 'package:drevol/utils/appUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderState().providerStateList,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Drevol',
        navigatorObservers: [AppUtils().routeObserver],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) {
      SharedPreferences.getInstance().then((pref) {
        var isLoggedIn = pref.getBool("isLoggedIn");

        if (isLoggedIn == true) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
