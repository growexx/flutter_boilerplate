import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserRepository model;

  setUpAll(() async{
    model = UserRepository();
    SharedPreferences.setMockInitialValues({});
    await dotenv.load();
  });

  group('UserRepository', () {
    test(
      "initial values",
      () {
        expect(model.currentUser?.id, isNull);
        expect(model.isLoggedIn, false);
      },
    );

    test(
      "add data",
      () async {
        model = UserRepository(currentUser: User(firstName: "test"));
        await model.updateUserData(User(firstName: "test"));
        expect(model.currentUser?.firstName, "test");

        await model.updateUserData(null);
        expect(model.currentUser?.firstName, null);
      },
    );
    test(
      "show fetched data",
      () async {
        User user = await UserRepository.fetchUserData();
        expect(user.email, isNull);
      },
    );

    test(
      "logout",
          () async {
        // model.signOutUser(context);
        // model.directLogOut(context);
      },
    );


  });


}
