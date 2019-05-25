import 'package:flutter/material.dart';

class CardExample extends StatefulWidget {
  CardExample({Key key}) : super(key: key);

  @override
  _CardExampleState createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              Card(
                color: Colors.green,
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Card Widget Example #1'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              Card(
                color: Colors.orange,
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Card Widget Example #2'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              Container(
                height: 140,
                child: Card(
                  color: Colors.blue,
                  margin: EdgeInsets.all(18),
                  elevation: 7.0,
                  child: Center(
                    child: Text("Card Widget Example #3"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Nice place to visit'),
                      subtitle: Text('Card Widget Example #4'),
                    ),
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('VISIT'),
                            onPressed: () {
                              print("visit");
                            },
                          ),
                          FlatButton(
                            child: const Text('DECLINE'),
                            onPressed: () {
                              print("decline");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
