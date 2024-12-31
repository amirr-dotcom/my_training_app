class SortTitle {
  String? title;
  List<String>? values;

  SortTitle({this.title, this.values});

  SortTitle.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['values'] = values;
    return data;
  }

  void addValues(List<String> newValues) {
    values ??= [];
    values!.addAll(newValues);
  }
}