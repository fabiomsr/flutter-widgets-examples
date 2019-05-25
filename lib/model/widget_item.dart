class WidgetItem {
  final int id;
  final String name;
  final String family;

  WidgetItem({this.id, this.name, this.family});

  factory WidgetItem.fromJson(Map<String, dynamic> json) {
    return WidgetItem(
      id: json['id'] as int,
      name: json['name'] as String,
      family: json['family'] as String,
    );
  }
}
