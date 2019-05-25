import 'package:flutter/material.dart';
import 'model/widget_item.dart';
import 'detail.dart';
import 'dart:convert';

class WidgetExampleCatalogHome extends StatelessWidget {
  final String title;

  WidgetExampleCatalogHome({Key key, this.title}) : super(key: key);

  Future<List<WidgetItem>> parseWidgets(String responseBody) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<WidgetItem>((json) => WidgetItem.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        child: FutureBuilder<List<WidgetItem>>(
          future: DefaultAssetBundle.of(context).loadStructuredData(
              'assets/widgets.json', (widget) => parseWidgets(widget)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            return snapshot.hasData
                ? WidgetExampleList(widgets: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }
}

class WidgetExampleList extends StatelessWidget {
  final List<WidgetItem> widgets;

  WidgetExampleList({Key key, this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
                color: Colors.white10,
                alignment: Alignment.center,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.widgets),
                        title: Text(widgets[index].name),
                        subtitle: Text(widgets[index].family),
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Demo'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WidgetDemoDetailPage(
                                              item: widgets[index])),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
