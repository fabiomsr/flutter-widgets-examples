import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CustomPaintExample extends StatefulWidget {
  CustomPaintExample({Key key}) : super(key: key);

  @override
  _CustomPaintExampleState createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: CustomPaint(
        painter: FaceEmotionPainter(),
      ),
    );
  }
}

class FaceEmotionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final Paint backgroundPaint = new Paint()..style = PaintingStyle.fill;
    backgroundPaint..color = Colors.green;

    final Paint facePaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    // Draw Container
    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius / 0.9), backgroundPaint);

    // Draw mouth
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 4), 0,
        Math.pi, false, facePaint);

    // Draw face
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 10.0, 20.0,
        false, facePaint);

    // Draw eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 4), 2, facePaint);
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 4), 2, facePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
