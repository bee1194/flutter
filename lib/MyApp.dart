import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget buildBtn(IconData icon, String title) {
    final Color tintColor = Colors.blue;
    return new Column(
      children: [
        new Icon(
          icon,
          color: tintColor,
        ),
        new Container(
          child: new Text(
            title,
            style: new TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter App"),
            centerTitle: true,
          ),
          body: new ListView(
            children: <Widget>[
              new Image.asset('images/tutorialChannel.png', fit: BoxFit.cover),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: new Text(
                              "Programming tutorials Channel",
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Text(
                            "This channel contains tutorial videos in Flutter",
                            style: new TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          new Text("100")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Container(  
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildBtn(Icons.home, "Home"),
                    buildBtn(Icons.arrow_back, "Back"),
                    buildBtn(Icons.arrow_forward, "Next"),
                    buildBtn(Icons.share, "Share"),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(20.0),
                child: new Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textAlign: TextAlign.justify,
                    ),
              ),
            ],
          )),
    );
  }
}
