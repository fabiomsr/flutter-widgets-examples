import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  TransformExample({Key key}) : super(key: key);

  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              ),
              Transform(
                transform: Matrix4.skew(0.1, 0.2),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              ),
              Transform.rotate(
                angle: 1.0,
                child: Container(
                  color: Colors.green,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
              ),
              Transform.scale(
                scale: 2.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  height: 50.0,
                  width: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              ),
              Transform.translate(
                offset: Offset(50.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 100.0,
                  width: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
