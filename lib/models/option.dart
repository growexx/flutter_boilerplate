

class Option<T> {
  String? title;
  String? value;
  T? extra;

  Option({this.title, this.value, this.extra});

  Option.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title = json['title'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['extra'] = extra;
    return data;
  }
}
