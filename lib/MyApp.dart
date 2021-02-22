import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'randomenglishwords.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "This is my first Flutter App",
      home: new RandomEnglishWords()
    );
  }
}
