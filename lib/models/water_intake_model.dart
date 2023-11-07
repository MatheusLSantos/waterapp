class WaterIntake {

  final double waterIntakeVolume;
  final DateTime _createdAt;

  WaterIntake({required this.waterIntakeVolume}) : _createdAt = DateTime.now();

  DateTime get createdAt => _createdAt;
}