// Mocks generated by Mockito 5.4.4 from annotations
// in holiday/test/holiday/get_from_local.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:holiday/client/holiday_client.dart' as _i2;
import 'package:holiday/domain/holiday/model/holiday.dart' as _i3;
import 'package:holiday/domain/holiday/repository/holiday_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHolidayClient_0 extends _i1.SmartFake implements _i2.HolidayClient {
  _FakeHolidayClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHolidayResponse_1 extends _i1.SmartFake
    implements _i3.HolidayResponse {
  _FakeHolidayResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HolidayRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHolidayRepository extends _i1.Mock implements _i4.HolidayRepository {
  MockHolidayRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HolidayClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeHolidayClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.HolidayClient);

  @override
  set client(_i2.HolidayClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic setList(List<_i3.Holiday>? holidayList) =>
      super.noSuchMethod(Invocation.method(
        #setList,
        [holidayList],
      ));

  @override
  dynamic setLastUpdateDate(DateTime? updateDatetime) =>
      super.noSuchMethod(Invocation.method(
        #setLastUpdateDate,
        [updateDatetime],
      ));

  @override
  _i5.Future<_i3.HolidayResponse> getListFromSever() => (super.noSuchMethod(
        Invocation.method(
          #getListFromSever,
          [],
        ),
        returnValue:
            _i5.Future<_i3.HolidayResponse>.value(_FakeHolidayResponse_1(
          this,
          Invocation.method(
            #getListFromSever,
            [],
          ),
        )),
      ) as _i5.Future<_i3.HolidayResponse>);

  @override
  _i5.Future<List<_i3.Holiday>> getListFromAsset() => (super.noSuchMethod(
        Invocation.method(
          #getListFromAsset,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Holiday>>.value(<_i3.Holiday>[]),
      ) as _i5.Future<List<_i3.Holiday>>);
}
