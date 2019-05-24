import 'package:flutter/material.dart';
import 'model/widget_item.dart';
import 'package:flutter_widgets_examples/catalog/animation_and_motion_widgets/animated_container.dart';
import 'package:flutter_widgets_examples/catalog/animation_and_motion_widgets/decorated_box_transition.dart';
import 'package:flutter_widgets_examples/catalog/animation_and_motion_widgets/positioned_transition.dart';
import 'package:flutter_widgets_examples/catalog/material_widgets/card.dart';
import 'package:flutter_widgets_examples/catalog/material_widgets/drawer.dart';
import 'package:flutter_widgets_examples/catalog/material_widgets/radio.dart';
import 'package:flutter_widgets_examples/catalog/painting_and_effects/custom_paint.dart';
import 'package:flutter_widgets_examples/catalog/painting_and_effects/transform.dart';
import 'package:flutter_widgets_examples/catalog/tween/custom_tween.dart';

class WidgetDemoDetailPage extends StatefulWidget {

  final WidgetItem item;

  const WidgetDemoDetailPage({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetDemoDetailPageState();
}

class _WidgetDemoDetailPageState extends State<WidgetDemoDetailPage> {


  var widgets = [
  AnimatedContainerExample(),
  DecoratedBoxTransitionExample(),
  PositionedTransitionExample(),
  CardExample(),
  DrawerExample(),
  RadioExample(),
  CustomPaintExample(),
  TransformExample(),
  CustomTween()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.item.name),
      ),
      body: widgets[this.widget.item.id],
    );
  }

}
