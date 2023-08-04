import 'package:flutter_boilerplate/app_manager/api/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group("api response ", () {
    test("test", (){
      ApiResponse apiResponse=ApiResponse.initial("");
      expect(apiResponse.data, isNull);
      expect(apiResponse.message, isEmpty);
      apiResponse=ApiResponse.empty("empty data");
      expect(apiResponse.data, isNull);
      expect(apiResponse.message, "empty data");
      apiResponse=ApiResponse.completed("Done");
      expect(apiResponse.data, "Done");
      expect(apiResponse.toString(), isNotEmpty);
    });
  });
}