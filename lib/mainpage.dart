import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;
  MainPage({this.title}) : super();
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5.0),
        children: _buildGridTiles(6),
      ),
    );
  }

  List<Widget> _buildGridTiles(numberOftiles) {
    List<Container> containers =
        new List<Container>.generate(numberOftiles, (int index) {
      final imageName = index < numberOftiles
          ? 'images/img0${index + 1}.jpg'
          : 'images/img${index + 1}.jpg';
      return new Container(
        child: new Image.asset(
          imageName,
          fit: BoxFit.cover,
          ),
      );
    });
    return containers;
  }
}
