import 'package:ecommerce/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(floatingActionButtonTheme: FloatingActionButtonThemeData()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
