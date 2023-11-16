import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:lottie/lottie.dart';
import 'configs/app_settings.dart';

class WeightScreen extends StatelessWidget {

  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
        ),
        Lottie.asset(
          'assets/backgroundwave_ani.json',
          fit: BoxFit.cover,
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(''),
          ),
          body: Center(
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(24),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Qual é o seu peso?',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: 'Peso (kg)',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para salvar o peso do usuário
                        double value = double.tryParse(_weightController.text) ?? 0.0;
                        context.read<AppSettings>().setWeight(value);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}