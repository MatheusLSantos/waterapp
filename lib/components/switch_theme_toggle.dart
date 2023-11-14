import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/theme/color_schemes.g.dart';

class SwitchThemeToggle extends StatelessWidget {
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

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}