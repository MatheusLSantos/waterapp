class WaterIntake {

  final int id;
  final double waterIntakeVolume;
  final DateTime createdAt;
  final int diary;

  WaterIntake({required this.waterIntakeVolume, required this.createdAt, this.id = 0, required this.diary});

  Map<String, dynamic> toMap() {
    return {
      'waterIntakeVolume': waterIntakeVolume,
      'createdAt': createdAt.toString(),
      'diary': diary
    };
  }
}