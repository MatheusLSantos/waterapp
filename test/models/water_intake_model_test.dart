import 'package:waterproject3/models/water_intake_model.dart';
import 'package:test/test.dart';

void main() {
  group("createdAt attribute", () {
    test("should be a DateTime", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 1.0);
      expect(waterIntake.createdAt is DateTime, true);
    });
    test("should be the actual time", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 2.0);
      DateTime actualTime = DateTime.now();
      expect(waterIntake.createdAt == actualTime, true);
    });
  });
  group("waterIntakeVolume attribute", () {
    test("should be a double", () {
      WaterIntake waterIntake = WaterIntake(waterIntakeVolume: 1.0);
      expect(waterIntake.waterIntakeVolume is double, true);
    });
  });
}
