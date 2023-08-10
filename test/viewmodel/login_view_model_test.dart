import 'package:flutter_boilerplate/view_model/veiw_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "model test is done",
    () {
      final model = LoginViewModel();
      expect(model.toString().isEmpty, false);
    },
  );
}
