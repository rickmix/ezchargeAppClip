import 'package:ezcharge_app_clip/app/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App clip',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
