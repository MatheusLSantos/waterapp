import 'package:waterproject3/models/diary_model.dart';
import 'package:test/test.dart';
import 'package:waterproject3/models/water_intake_model.dart';

void main() {

  group("year attribute", () {
    test("should be a int", () {
      Diary diary = Diary(id :1, day: 1, month: 1, year: 2001);
      expect(diary.year is int, true);
    });
  });
  group("month attribute", () {
    test("should be a int", () {
      Diary diary = Diary(id :1, day: 1, month: 1, year: 2001);
      expect(diary.month is int, true);
    });
  });
  group("day attribute", () {
    test("should be a int", () {
      Diary diary = Diary(id :1, day: 1, month: 1, year: 2001);
      expect(diary.day is int, true);
    });
  });
}
