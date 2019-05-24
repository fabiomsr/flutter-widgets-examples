import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadioExampleState();
}

class RadioExampleState extends State<RadioExample> {
  int _index = 1;
  String _value = '';

  final List<DummyItem> _emotions = [
    DummyItem(index: 1, value: "option1"),
    DummyItem(index: 2, value: "option2"),
    DummyItem(index: 3, value: "option3"),
    DummyItem(index: 4, value: "option4")
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _emotions
              .map((item) => Radio(
                    groupValue: _index,
                    value: item.index,
                    onChanged: (val) {
                      setState(() {
                        _index = val;
                        _value = item.value;
                      });
                      print("ITEM : $_index with VALUE : $_value");
                    },
                  ))
              .toList()),
    );
  }
}

class DummyItem {
  int index;
  String value;

  DummyItem({this.index, this.value});
}
