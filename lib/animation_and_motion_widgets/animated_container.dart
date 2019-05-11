import 'package:flutter/material.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: AnimatedContainerExample(title: 'Animated Container'),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  AnimatedContainerExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color _color = Color(0xffCFF09E); // Start Color
  Size _size = Size.square(100); // Start Size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                color: _color,
                duration: Duration(seconds: 3),
                width: _size.width,
                height: _size.height,
                curve: Curves.bounceIn,
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () => setState(() {
                      _color = Colors.lightGreen; // End Color
                      _size = Size.square(300); // End Size
                    }),
              )
            ],
          ),
        ));
  }
}
