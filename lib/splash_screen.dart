import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/name_screen.dart';
import 'configs/app_settings.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // Aguarde a inicialização do AppSettings
    await _initAppSettings();

    // Simule o carregamento da tela de splash
    await Future.delayed(Duration(seconds: 3));

    // Verifique se o usuário já viu a tela
    bool _seen = await _getSeenStatus();

    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      await _setSeenStatus(true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NameScreen()),
      );
    }
  }

  Future<void> _initAppSettings() async {
    // Inicialize o AppSettings aqui
    await Provider.of<AppSettings>(context, listen: false).startPreferences();
  }

  Future<bool> _getSeenStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seen') ?? false;
  }

  Future<void> _setSeenStatus(bool seen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', seen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splashscreen2_ani.json'),
      ),
    );
  }
}

