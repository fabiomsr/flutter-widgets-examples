import 'package:flutter/material.dart';

void main() => runApp(DecoratedBoxTransitionApp());

class DecoratedBoxTransitionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decorated Box Transition',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: DecoratedBoxTransitionExample(title: 'Decorated Box Transition'),
    );
  }
}

class DecoratedBoxTransitionExample extends StatefulWidget {
  DecoratedBoxTransitionExample({Key key, this.title}) : super(key: key);

  final String title;

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
}
