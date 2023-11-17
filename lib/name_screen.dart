import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/configs/app_settings.dart';
import 'package:waterproject3/weight_screen.dart';
import 'package:lottie/lottie.dart';

class NameScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  String? _validateInput(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (value.length > 15) {
      return 'Máximo de 15 caracteres permitidos';
    }

    if (value.contains('  ')) {
      return 'Não pode conter espaços duplos';
    }

    if (value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Não pode conter símbolos';
    }

    return null; // A entrada é válida
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
            automaticallyImplyLeading: false,
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
                      'Como devo te chamar?',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLength: 15,
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome ou apelido',
                        border: UnderlineInputBorder(),
                        errorText: _validateInput(_nameController.text),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String? validationError = _validateInput(_nameController.text);
                        if (validationError == null) {
                          // A entrada é válida, salvar o nome do usuário
                          context.read<AppSettings>().setName(_nameController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WeightScreen()));
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
