import 'package:covid_19_ui/Screens/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
      home: LoadingScreen(
      )
    );
  }
}