
import 'package:flutter/material.dart';
import 'package:flutterchatapp/pages/home_page.dart';
import 'package:flutterchatapp/pages/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs,));
  });
}



class MyApp extends StatefulWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _decideMainPage(),
    );
  }

  _decideMainPage() {

    if (widget.prefs.getBool('is_verified') != null) {

      if (widget.prefs.getBool('is_verified')) {
        return HomePage(prefs: widget.prefs);
        // return RegistrationPage(prefs: prefs);
      } else {
        return RegistrationPage(prefs: widget.prefs);
      }
    } else {
      return RegistrationPage(prefs: widget.prefs);
    }
  }



}