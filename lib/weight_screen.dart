import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importe o pacote necessário
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:lottie/lottie.dart';
import 'configs/app_settings.dart';

class WeightScreen extends StatelessWidget {
  final TextEditingController _weightController = TextEditingController();
  static const MAXWEIGHT = 600;
  static const MLWEIGHT = 35;

  String? _validateInput(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }

    try {
      double weight = double.parse(value);
      if (weight <= 2 || weight > MAXWEIGHT) {
        return 'O peso deve estar entre 3 e $MAXWEIGHT kg';
      }
    } catch (e) {
      return 'Digite um valor de peso válido';
    }

    return null; // A entrada é válida
  }

  void _setIntakeGoal(BuildContext context, double weight) async {
    double intakeGoal = weight * MLWEIGHT;
    context.read<AppSettings>().setIntakeGoal(intakeGoal);
  }

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
                      maxLength: 5,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      controller: _weightController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}$')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Exemplo: 74.2',
                        border: UnderlineInputBorder(),
                        errorText: _validateInput(_weightController.text),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String? validationError = _validateInput(_weightController.text);
                        if (validationError == null) {
                          // A entrada é válida, salvar o peso do usuário
                          double value = double.parse(_weightController.text);
                          context.read<AppSettings>().setWeight(value);
                          _setIntakeGoal(context, value);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        } else {
                          // A entrada é inválida, exibir uma mensagem de erro ou tomar outra ação necessária
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(validationError),
                              backgroundColor: Theme.of(context).colorScheme.error,
                            ),
                          );
                        }
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
