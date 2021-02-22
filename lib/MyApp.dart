import 'package:app/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//You can define your own Widget
// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  //StatefulWidget has internal "state"
  String name;
  int age;
  MyApp({this.name, this.age}); //name, age is state ? No !, it is properties
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Transaction transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Init state');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('Dispose here');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "This is a StatefulWidget",
        home: new Scaffold(
          key: this._scaffoldKey,
          body: new SafeArea(
              minimum: EdgeInsets.only(left: 20, right: 20),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(labelText: "Content"),
                    controller: this._contentController,
                    onChanged: (text) {
                      this.setState(() {
                        this.transaction.content = text;
                      });
                    },
                  ),
                  new TextField(
                    decoration: new InputDecoration(labelText: "Amount(money)"),
                    controller: this._amountController,
                    onChanged: (text) {
                      this.setState(() {
                        this.transaction.amount = double.tryParse(text) ?? 0.0;
                      });
                    },
                  ),
                  new FlatButton(
                    child: new Text("Insert Transaction"),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      this.setState(() {
                        this._transactions.add(this.transaction);
                        this.transaction =
                            Transaction(content: '', amount: 0.0);
                        this._contentController.text = '';
                        this._amountController.text = '';
                        
                      });
                      this._scaffoldKey.currentState.showSnackBar(new SnackBar(
                            content: new Text("Transaction list: " +
                                this._transactions.toString()),
                            duration: Duration(seconds: 3),
                          ));
                    },
                  ),
                ],
              )),
        ));
  }
}
