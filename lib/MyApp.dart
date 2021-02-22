import 'package:flutter/material.dart';
import 'mainpage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "",
      home: new MainPage(title: "Gridview of Images",),
    );
  }
}
