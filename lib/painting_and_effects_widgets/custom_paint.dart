import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() => runApp(AnimatedContainerApp());

enum Emotion { happy, normal, sad }

class AnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Painter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: CustomPainterExample(
        emotion: Emotion.normal,
      ),
    );
  }
}

class CustomPainterExample extends StatefulWidget {
  CustomPainterExample({Key key, this.emotion}) : super(key: key);

  final Emotion emotion;

  @override
  _CustomPainterExampleState createState() =>
      _CustomPainterExampleState(emotion);
}

class _CustomPainterExampleState extends State<CustomPainterExample> {
  Emotion _emotion;

  _CustomPainterExampleState(Emotion emotion) {
    _emotion = emotion;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: CustomPaint(
        painter: FaceEmotionPainter(_emotion),
      ),
    );
  }
}

class FaceEmotionPainter extends CustomPainter {
  Emotion _emotion;

  FaceEmotionPainter(Emotion emotion) {
    _emotion = emotion;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final Paint facePaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    drawEmotion(_emotion, canvas, facePaint, center, radius);
    drawPlainElements(canvas, facePaint, center, radius);
  }

  void drawPlainElements(
      Canvas canvas, Paint facePaint, Offset center, double radius) {
    // Draw face container
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 10.0, 20.0,
        false, facePaint);

    // Draw eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 4), 2, facePaint);
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 4), 2, facePaint);
  }

  void drawEmotion(Emotion emotion, Canvas canvas, Paint facePaint,
      Offset center, double radius) {
    final Paint _backgroundPaint = new Paint()..style = PaintingStyle.fill;

    switch (emotion) {
      case Emotion.happy:
        _backgroundPaint..color = Colors.green;
        drawHappy(canvas, facePaint, center, radius, _backgroundPaint);
        break;
      case Emotion.normal:
        _backgroundPaint..color = Colors.blue;
        drawNormal(canvas, facePaint, center, radius, _backgroundPaint);
        break;
      default: // Emotion.sad.
        _backgroundPaint..color = Colors.red;
        drawSad(canvas, facePaint, center, radius, _backgroundPaint);
        break;
    }
  }

  void drawHappy(Canvas canvas, Paint facePaint, Offset center, double radius,
      Paint backgroundPaint) {
    // Draw Background
    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius * 1.2), backgroundPaint);
    // Draw mouth
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 4), 0,
        Math.pi, false, facePaint);
  }

  void drawNormal(Canvas canvas, Paint facePaint, Offset center, double radius,
      Paint backgroundPaint) {
    // Draw Background
    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius * 1.2), backgroundPaint);
    // Draw mouth
    canvas.drawLine(Offset(center.dx - radius / 2, center.dy + radius / 4),
        Offset(center.dx + radius / 2, center.dy + radius / 4), facePaint);
  }

  void drawSad(Canvas canvas, Paint facePaint, Offset center, double radius,
      Paint backgroundPaint) {
    // Draw Background
    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius * 1.2), backgroundPaint);
    // Draw mouth
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 4), 66,
        Math.pi, false, facePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}