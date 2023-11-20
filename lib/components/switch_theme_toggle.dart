import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/theme/color_schemes.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchThemeToggle extends StatefulWidget {
  @override
  State<SwitchThemeToggle> createState() => _SwitchThemeToggleState();
}

class _SwitchThemeToggleState extends State<SwitchThemeToggle> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        themeProvider.toggleTheme();
      },
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeData _lightColorScheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
  ThemeData _darkColorScheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

  bool _isDarkMode = false;

  ThemeData get currentTheme => _isDarkMode ? _darkColorScheme : _lightColorScheme;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();

    // Save the theme preference to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }

}