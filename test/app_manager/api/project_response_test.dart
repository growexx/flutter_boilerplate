
import 'package:flutter_boilerplate/app_manager/api/project_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProjectResponse message1 = ProjectResponse(
      status: 1,
  message: "Success");

  test("ProjectResponse Model Test", () {
    Map<String, dynamic> json = message1.toJson();
    ProjectResponse object = ProjectResponse.fromJson(json);

    expect(json.isNotEmpty, true);
    expect(object.status, 1);
    expect(object.message, "Success");
  },);

}