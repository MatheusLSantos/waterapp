import 'package:flutter/material.dart';
import 'package:waterproject3/weight_screen.dart';
import 'package:lottie/lottie.dart';

class NameScreen extends StatelessWidget {
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
                      'Como devo te chamar?',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLength: 15,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nome ou apelido',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para salvar o peso do usuário
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>WeightScreen()));
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