// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_boilerplate/test/view/screens/google_map_filed_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;
import 'dart:ui' as _i6;

import 'package:flutter_boilerplate/view_model/google_map_view_model.dart'
    as _i4;
import 'package:geolocator/geolocator.dart' as _i5;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCompleter_0<T> extends _i1.SmartFake implements _i2.Completer<T> {
  _FakeCompleter_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCameraPosition_1 extends _i1.SmartFake
    implements _i3.CameraPosition {
  _FakeCameraPosition_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GoogleMapViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleMapInnerViewModel extends _i1.Mock
    implements _i4.GoogleMapViewModel {
  @override
  set currentAddress(String? _currentAddress) => super.noSuchMethod(
        Invocation.setter(
          #currentAddress,
          _currentAddress,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set currentPosition(_i5.Position? _currentPosition) => super.noSuchMethod(
        Invocation.setter(
          #currentPosition,
          _currentPosition,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isLocationServiceEnabled => (super.noSuchMethod(
        Invocation.getter(#isLocationServiceEnabled),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isLocationServiceEnabled(bool? _isLocationServiceEnabled) =>
      super.noSuchMethod(
        Invocation.setter(
          #isLocationServiceEnabled,
          _isLocationServiceEnabled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Completer<_i3.GoogleMapController> get controller => (super.noSuchMethod(
        Invocation.getter(#controller),
        returnValue: _FakeCompleter_0<_i3.GoogleMapController>(
          this,
          Invocation.getter(#controller),
        ),
        returnValueForMissingStub: _FakeCompleter_0<_i3.GoogleMapController>(
          this,
          Invocation.getter(#controller),
        ),
      ) as _i2.Completer<_i3.GoogleMapController>);
  @override
  _i3.CameraPosition get kGooglePlex => (super.noSuchMethod(
        Invocation.getter(#kGooglePlex),
        returnValue: _FakeCameraPosition_1(
          this,
          Invocation.getter(#kGooglePlex),
        ),
        returnValueForMissingStub: _FakeCameraPosition_1(
          this,
          Invocation.getter(#kGooglePlex),
        ),
      ) as _i3.CameraPosition);
  @override
  set kGooglePlex(_i3.CameraPosition? _kGooglePlex) => super.noSuchMethod(
        Invocation.setter(
          #kGooglePlex,
          _kGooglePlex,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set setCurrentPosition(_i5.Position? fetchedPosition) => super.noSuchMethod(
        Invocation.setter(
          #setCurrentPosition,
          fetchedPosition,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set setLocationServiceStatus(bool? isEnabled) => super.noSuchMethod(
        Invocation.setter(
          #setLocationServiceStatus,
          isEnabled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set setCurrentAddress(String? convertedLocation) => super.noSuchMethod(
        Invocation.setter(
          #setCurrentAddress,
          convertedLocation,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
