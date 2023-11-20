import 'package:waterproject3/models/water_intake_model.dart';
import 'package:test/test.dart';
import 'package:waterproject3/models/diary_model.dart';

void main() {
  Diary diary = Diary(year: DateTime.now().year, month: DateTime.now().month, day: DateTime.now().day);
  group("createdAt attribute", () {
    test("should be a DateTime", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 1.0, createdAt: DateTime.now(), id:1,diary: diary.id);
      expect(waterIntake.createdAt is DateTime, true);
    });
    test("should be the actual time", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 2.0, createdAt: DateTime.now(), id:2,diary: diary.id);
      DateTime actualTime = DateTime.now();
      expect(waterIntake.createdAt == actualTime, true);
    });
  });
  group("waterIntakeVolume attribute", () {
    test("should be a double", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 1.0, createdAt: DateTime.now(), id:2,diary: diary.id);
      expect(waterIntake.waterIntakeVolume is double, true);
    });
  });
}
