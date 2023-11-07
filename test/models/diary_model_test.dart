import 'package:waterproject3/models/diary_model.dart';
import 'package:test/test.dart';

void main() {
  group("year attribute", () {
    test("should be a int", () {
      Diary diary = Diary();
      expect(diary.year is int, true);
    });
  });
  group("month attribute", () {
    test("should be a int", () {
      Diary diary = Diary();
      expect(diary.month is int, true);
    });
  });
  group("day attribute", () {
    test("should be a int", () {
      Diary diary = Diary();
      expect(diary.day is int, true);
    });
  });
}
