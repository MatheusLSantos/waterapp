import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waterproject3/database/db.dart';
import 'package:waterproject3/models/water_intake_model.dart';

class WaterIntakeRepository extends ChangeNotifier{
  late DB db;

  Future<int> insertWaterIntake(WaterIntake waterIntake) async {
    try{
      final db = await DB.instance.database;
      int id = await db.insert(
          'waterIntakes',
          waterIntake.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
      return id;
    }
    catch (e) {
      print('Error inserting diary: $e');
      return -1;
    }
  }

  Future<List<WaterIntake>> waterIntakes() async {
    final db = await DB.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('waterIntakes');

    return List.generate(maps.length, (i) {
      return WaterIntake(
        id: maps[i]['id'] as int,
        waterIntakeVolume: maps[i]['waterIntakeVolume'] as double,
        createdAt: maps[i]['createdAt'] as DateTime,
        diary: maps[i]['diary'] as int
      );
    });
  }

  Future<void> updateWaterIntake(WaterIntake waterIntake) async {
    final db = await DB.instance.database;

    await db.update(
      'waterIntakes',
      waterIntake.toMap(),
      where: 'id = ?',
      whereArgs: [waterIntake.id],
    );
  }

  Future<void> deleteWaterIntake(int id) async {
    final db = await DB.instance.database;

    await db.delete(
      'waterIntakes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}