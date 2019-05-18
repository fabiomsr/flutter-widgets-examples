import 'package:flutter/material.dart';

void main() => runApp(PositionedTransitionApp());

class PositionedTransitionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Positioned Transition',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: PositionedTransitionExample(title: 'Positioned Transition'),
    );
  }
}

class PositionedTransitionExample extends StatefulWidget {
  PositionedTransitionExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      })
      ..forward();

    _animation = new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(75.0, 400.0, 75.0, 100.0),
      end: new RelativeRect.fromLTRB(150.0, 100.0, 150.0, 400.0),
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        PositionedTransition(
          rect: _animation,
          child: Container(
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}
