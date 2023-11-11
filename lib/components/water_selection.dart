import 'package:flutter/material.dart';

class WaterSeleciton extends StatelessWidget {
  final Function(int) onButtonPressed;

  WaterSeleciton({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Escolha uma opção'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            onButtonPressed(1);
            Navigator.of(context).pop();
          },
          child: Text('Botão 1'),
        ),
        ElevatedButton(
          onPressed: () {
            onButtonPressed(2);
            Navigator.of(context).pop();
          },
          child: Text('Botão 2'),
        ),
        ElevatedButton(
          onPressed: () {
            onButtonPressed(3);
            Navigator.of(context).pop();
          },
          child: Text('Botão 3'),
        ),
        ElevatedButton(
          onPressed: () {
            onButtonPressed(4);
            Navigator.of(context).pop();
          },
          child: Text('Botão 4'),
        ),
        ElevatedButton(
          onPressed: () {
            onButtonPressed(5);
            Navigator.of(context).pop();
          },
          child: Text('Botão 5'),
        ),
      ],
    );
  }
}
