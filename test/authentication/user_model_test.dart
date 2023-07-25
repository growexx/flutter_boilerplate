
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  Map<String, dynamic> userDummyData= {
    "id": "c7e11280-feb7-11ed-bdf6-17eaa50ca463",
    "email": "developer@mailinator.com",
    "first_name": "Sam",
    "last_name": "Jones",
    "profile_url": null,
  };


  test("UserModel Model Test", () {
    User object = User.fromJson(userDummyData);
    Map<String, dynamic> json = object.toJson();

    expect(object.id!.isNotEmpty, true);
    expect(json.isNotEmpty, true);
    User customObject = User(
        id: "1",
    );

    expect(customObject.id, "1");
    expect(customObject.id, "1");

  },);



}