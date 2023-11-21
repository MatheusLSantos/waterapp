import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'package:provider/provider.dart';
import 'components/switch_theme_toggle.dart';
import 'configs/app_settings.dart';
import 'repositories/diary_repository.dart';
import 'repositories/water_intake_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => DiaryRepository()),
        ChangeNotifierProvider(create: (context) => WaterIntakeRepository()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}

