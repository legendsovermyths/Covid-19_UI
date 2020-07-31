import 'package:flutter/material.dart';
import 'constants.dart';
import 'Screens/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid-19 UI",
      theme:ThemeData(
        primaryColor: kprimaryColor,
        scaffoldBackgroundColor: kbackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: ktextColor),
      ),
      home: HomeScreen(
      )
    );
  }
}