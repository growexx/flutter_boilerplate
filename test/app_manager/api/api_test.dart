

import 'package:flutter_boilerplate/app_manager/api/api_call.dart';
import 'package:flutter_boilerplate/app_manager/api/api_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import '../../util/common_initial_activity.dart';

void main() async{
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();
  group("api test", () {

    test("enum test", ()  {
      expect(ApiType.get.name, "get");
      expect(ApiType.post.name, "post");
      expect(ApiType.rawPost.name, "rawPost");
      expect(ApiType.multiPartRequest.name, "multiPartRequest");
      expect(ApiType.multiPartRequestPUT.name, "multiPartRequestPUT");
      expect(ApiType.put.name, "put");
      expect(ApiType.rawPut.name, "rawPut");
      expect(ApiType.options.name, "options");
      expect(ApiType.patch.name, "patch");
      expect(ApiType.delete.name, "delete");

    });
    test("test", ()  async{
      expect(rawHeader, isNotEmpty);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.post(body: {})), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.get(),token: true), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.rawPost(body: {})), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.multiPartRequestPUT(
          body: <String,String>{},
      )), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.multiPartRequest(body: {},)), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.put(body: {})), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.rawPut(body: {})), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.options()), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.delete()), ApiConstant.cancelResponse);
      expect(await ApiCall().call(client: http.Client(),url: "", apiCallType: ApiCallType.patch(body: {})), ApiConstant.cancelResponse);

    });

  });

}