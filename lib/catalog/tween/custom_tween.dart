import 'package:flutter/material.dart';
import 'dart:math' show sin, pi;

class CustomTweenExample extends StatefulWidget {
  CustomTweenExample({Key key}) : super(key: key);

  @override
  _CustomTweenExampleState createState() => _CustomTweenExampleState();
}

class _CustomTweenExampleState extends State<CustomTweenExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SlideTransition(
            position:
                CustomTween(begin: Offset(0, 0), end: Offset(0, 1), delay: 0)
                    .animate(_animationController),
            child: Container(
              color: Colors.pink,
              width: 50,
              height: 50,
            ),
          ),
          SlideTransition(
            position:
                CustomTween(begin: Offset(0, 0), end: Offset(0, 1), delay: 0.5)
                    .animate(_animationController),
            child: Container(
              color: Colors.pink,
              width: 50,
              height: 50,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class CustomTween extends Tween<Offset> {
  final double delay;

  CustomTween({Offset begin, Offset end, this.delay = 0.0})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    return super.lerp((sin((t - delay) * 2 * pi) + 1) / 2);
  }

  @override
  Offset evaluate(Animation<double> animation) => lerp(animation.value);
}
