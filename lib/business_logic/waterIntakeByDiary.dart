import 'package:flutter/material.dart';
import 'package:waterproject3/models/diary_model.dart';
import 'package:waterproject3/models/water_intake_model.dart';
import 'package:waterproject3/repositories/diary_repository.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class WaterIntakeByDiary {
  static Future<double> getTotalIntake(BuildContext context) async {
    Diary diary = await getDiary(context);

    double totalIntake = 0.0;

    List<WaterIntake> waterIntakes =
    await context.read<DiaryRepository>().waterIntakes(diary.id);
    waterIntakes.forEach((waterIntake) {
      totalIntake += waterIntake.waterIntakeVolume;
    });

    return totalIntake;
  }

  static Future<Diary> getDiary(BuildContext context) async {
    List<Diary> diarys = await context.read<DiaryRepository>().diarys();
    Diary? diary = diarys.firstWhereOrNull((element) =>
    element.day == DateTime.now().day &&
        element.month == DateTime.now().month &&
        element.year == DateTime.now().year);

    if (diary == null) {
      Diary new_diary = Diary(
          year: DateTime.now().year,
          month: DateTime.now().month,
          day: DateTime.now().day);
      int diary_id =
      await context.read<DiaryRepository>().insertDiary(new_diary);
      Diary created_diary =
      await context.read<DiaryRepository>().getDiary(diary_id);
      return created_diary;
    } else {
      return diary;
    }
  }
}