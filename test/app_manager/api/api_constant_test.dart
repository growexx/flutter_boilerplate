import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app_manager/api/api_constant.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    await dotenv.load();
  });

  group("api constant", () {
    test("test", () async {
      expect(ApiConstant.baseUrl, isNotEmpty);
      expect(ApiConstant.cancelResponse, isNotEmpty);
      expect(Environment.baseURL, isNotEmpty);
      if (!kDebugMode) {
        expect(ApiConstant.baseUrl, isNotEmpty);
      }
    });
  });
}
