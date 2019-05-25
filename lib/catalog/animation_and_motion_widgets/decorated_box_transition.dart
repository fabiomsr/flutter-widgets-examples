import 'package:flutter/material.dart';

class DecoratedBoxTransitionExample extends StatefulWidget {
  DecoratedBoxTransitionExample({Key key}) : super(key: key);

  @override
  _DecoratedBoxTransitionExampleState createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState
    extends State<DecoratedBoxTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: DecoratedBoxTransition(
            decoration: DecorationTween(
                    begin: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(64)),
                    end: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.horizontal()))
                .animate(_animationController),
            child: Container(width: 200, height: 200),
          )),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
