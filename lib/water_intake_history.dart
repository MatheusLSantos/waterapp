import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaterIntakeHistory extends StatefulWidget {
  const WaterIntakeHistory({Key? key});

  @override
  State<WaterIntakeHistory> createState() => _WaterIntakeHistoryState();
}

class _WaterIntakeHistoryState extends State<WaterIntakeHistory> {
  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deseja realmente apagar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Lógica para excluir do banco de dados aqui

                // Fechar o pop-up
                Navigator.of(context).pop();
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
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
        Lottie.asset(
          'assets/backgroundfish_ani.json',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Histórico de ingestão de água"),
          ),
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Card(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  elevation: 0,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1500ml / 2000ml', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog();
                          },
                        ),
                      ],
                    ),
                    subtitle: Text("06/11/2023 12:06", style: TextStyle(fontSize: 12)),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
