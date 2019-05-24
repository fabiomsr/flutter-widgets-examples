import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  PositionedTransitionExample({Key key}) : super(key: key);

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
