import 'package:flutter/material.dart';
import 'package:recipe/detailsPage.dart';
import 'package:recipe/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      debugShowCheckedModeBanner: false,
      home: 
      // DetailsPage()
      HomePage(),
    );
  }
}

