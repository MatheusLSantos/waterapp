import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences preferences;

  Future<void> _startPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<String> getName() async {
    await _startPreferences();
    return preferences.getString('name') ?? "Convidado";
  }

  void setName(String name) async {
    await preferences.setString('name', name);
  }

  Future<double> getWeight() async {
    await _startPreferences();
    return preferences.getDouble('weight') ?? 0.0;
  }

  void setWeight(double weight) async {
    await preferences.setDouble('weight', weight);
  }

  Future<bool> getFirstTime() async {
    await _startPreferences();
    return preferences.getBool('isFirstTime') ?? true;
  }

  void setFirstTime(bool isFirstTime) async {
    await preferences.setBool('isFirstTime', isFirstTime);
  }

  Future<bool> getDarkMode() async {
    await _startPreferences();
    return preferences.getBool('isDarkMode') ?? false;
  }

  void setDarkMode(bool isDarkMode) async {
    await preferences.setBool('isDarkMode', isDarkMode);
  }

  Future<double> getIntakeGoal() async {
    await _startPreferences();
    return preferences.getDouble('intakeGoal') ?? 2000;
  }

  void setIntakeGoal(double intakeGoal) async {
    await preferences.setDouble('intakeGoal', intakeGoal);
  }
}