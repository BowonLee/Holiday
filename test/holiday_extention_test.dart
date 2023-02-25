import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';

void main() {
  List<Holiday> mockList = [
    Holiday(
        date: DateTime(2023, 01, 20),
        dateName: "설날",
        dateKind: "공휴일",
        isHoliday: true),
    Holiday(
        date: DateTime(2023, 01, 21),
        dateName: "설날",
        dateKind: "공휴일",
        isHoliday: true),
    Holiday(
        date: DateTime(2023, 01, 22),
        dateName: "설날",
        dateKind: "공휴일",
        isHoliday: true),
    Holiday(
        date: DateTime(2023, 01, 23),
        dateName: "설날",
        dateKind: "공휴일",
        isHoliday: true),
    Holiday(
        date: DateTime(2023, 03, 1),
        dateName: "삼일절",
        dateKind: "공휴일",
        isHoliday: true),
  ];

  test("divide_year", () {
    var yearMap = mockList.divideByYear();
    expect(2023, yearMap.keys.first);
    expect(2024, yearMap.keys.last);
  });

  test("divide_mon", () {
    var monthMap = mockList.divideByMonth();
    expect(1, monthMap.keys.first);
    expect(3, monthMap.keys.last);
  });

  test("divide_year_mon", () {
    var monthMap = mockList.divideByYearAndMonth();
    expect(202301, monthMap.keys.first);
    expect(202403, monthMap.keys.last);
  });

  test("weekend", () {
    var withOutWeekend =
        mockList.divideByYearAndMonth()[202301]?.toWithoutWeekend();
    expect(2, withOutWeekend?.length);
  });

  test("remaining", () {
    var withOutWeekend =
        mockList.divideByYearAndMonth()[202301]?.toRemainingList();
    expect(4, withOutWeekend?.length);
  });

  test("toDateTIme", () {
    var temp = Holiday(
        date: DateTime(2023, 1, 20),
        dateName: "test",
        dateKind: "test",
        isHoliday: true);
    expect(temp.toDatetime(), DateTime(2023, 1, 20));
  });
}
