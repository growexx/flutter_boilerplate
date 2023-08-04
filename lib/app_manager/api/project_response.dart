class ProjectResponse<T> {
  int? status;
  T? data;
  String? message;

  ProjectResponse({this.status, this.data, this.message});

  ProjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}
