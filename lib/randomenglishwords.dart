import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RandomEnglishWordsState();
  }
}

class _RandomEnglishWordsState extends State<RandomEnglishWords> {
  final _words = <WordPair>[];
  final _checkedWords = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("List of English Words"),
        centerTitle: true,
        actions: [
          new IconButton(
            icon: new Icon(Icons.save),
            onPressed: () {
              final pageRoute =
                  new MaterialPageRoute(builder: (BuildContext context) {
                final listTitles = _checkedWords.map((wordPair) {
                  return new ListTile(
                    title: new Text(
                      wordPair.asUpperCase,
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  );
                });
                return new Scaffold(
                  appBar: new AppBar(
                    title: new Text("Checked Words"),
                  ),
                  body: new ListView(
                    children: listTitles.toList(),
                  ),
                );
              });
              Navigator.of(context).push(pageRoute);
            },
          ),
        ],
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_words[index], index);
        },
      ),
    );
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
      leading: new Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      title: new Text(
        wordPair.asCamelCase,
        style: new TextStyle(fontSize: 22.0, color: color),
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            _checkedWords.remove(wordPair);
          } else {
            _checkedWords.add(wordPair);
          }
        });
      },
    );
  }
}
