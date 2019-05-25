import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(WidgetExampleCatalogApp());

class WidgetExampleCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Example Catalog',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: WidgetExampleCatalogHome(
        title: "Widget Examples Catalog",
      ),
    );
  }
}
