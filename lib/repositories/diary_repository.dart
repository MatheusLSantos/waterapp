import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waterproject3/database/db.dart';
import 'package:waterproject3/models/diary_model.dart';
import 'package:waterproject3/models/water_intake_model.dart';

class DiaryRepository extends ChangeNotifier{
  late DB db;

  Future<int> insertDiary(Diary diary) async {
    try {
      final db = await DB.instance.database;
      int diaryId = await db.insert(
        'diarys',
        diary.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return diaryId;
    } catch (e) {
      print('Error inserting diary: $e');
      return -1;
    }
  }

  Future<List<Diary>> diarys() async {
    final db = await DB.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('diarys;');

    return List.generate(maps.length, (i) {
      return Diary(
        id: maps[i]['id'] as int,
        year: maps[i]['year'] as int,
        month: maps[i]['month'] as int,
        day: maps[i]['day'] as int,
      );
    });
  }

  Future<List<WaterIntake>> waterIntakes(int id) async {
    try {
      final db = await DB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query('waterIntakes', where: "diary = ?", whereArgs: [id]);

      return List.generate(maps.length, (i) {
        return WaterIntake(
          id: maps[i]['id'] as int,
          waterIntakeVolume: maps[i]['waterIntakeVolume'] as double,
          createdAt: DateTime.parse(maps[i]['createdAt']),
          diary: maps[i]['diary'] as int,
        );
      });
    } catch (e) {
      print('Error fetching water intakes: $e');
      return []; // Return an empty list or handle the error as needed
    }
  }

  Future<Diary> getDiary(int id) async {
    final db = await DB.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('diarys', where: "id = ?", whereArgs: [id], limit: 1);

    return Diary(
      id: maps[0]['id'] as int,
      year: maps[0]['year'] as int,
      month: maps[0]['month'] as int,
      day: maps[0]['day'] as int,
    );
  }

  Future<void> updateDiary(Diary diary) async {
    final db = await DB.instance.database;

    await db.update(
      'diarys',
      diary.toMap(),
      where: 'id = ?',
      whereArgs: [diary.id],
    );
  }

  Future<void> deleteDiary(int id) async {
    final db = await DB.instance.database;

    await db.delete(
      'diarys',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}