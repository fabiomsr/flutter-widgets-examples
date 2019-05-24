import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget {
  DrawerExample({Key key}) : super(key: key);

  @override
  _DrawerExampleState createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  final backgroundColors = [
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.orange
  ];

  String _name = 'Max Power';
  String _mail = 'max.power@mail.com';

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[selectedItem],
      body: Center(
        child: Text("Drawer Example"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(_mail),
              accountName: Text(_name),
            ),
            ListTile(
              title: Text("Green"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  selectedItem = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Purple"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  selectedItem = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Blue"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  selectedItem = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Orange"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  selectedItem = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
