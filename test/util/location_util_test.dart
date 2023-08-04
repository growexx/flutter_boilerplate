import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<LocationUtils>(
      as: #MockLocationUtils, onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  /*test('requestPermission', () async {

    final permission = await LocationUtils().handleLocationPermission(context);
    expect(permission, LocationPermission.whileInUse);
  });
  getCurrentPosition(context);
  getAddressFromLatLng(position);*/
}
