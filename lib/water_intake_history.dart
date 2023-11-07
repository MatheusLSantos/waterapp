import 'package:flutter/material.dart';

class waterIntakeHistory extends StatefulWidget {
  const waterIntakeHistory({super.key});

  @override
  State<waterIntakeHistory> createState() => _waterIntakeHistoryState();
}

class _waterIntakeHistoryState extends State<waterIntakeHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Histórico de ingestão de água"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              elevation: 0,
              child: ListTile(
                title: Text('1500ml / 2000ml'),
                trailing: Text("06/11/2023 12:06"),
              ),
            ),
          );
        },
      ),
    );
  }
}
