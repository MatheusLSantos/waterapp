import 'package:flutter/material.dart';

class WaterIntakeHistory extends StatefulWidget {
  const WaterIntakeHistory({super.key});

  @override
  State<WaterIntakeHistory> createState() => _WaterIntakeHistoryState();
}

class _WaterIntakeHistoryState extends State<WaterIntakeHistory> {
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
            padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: Card(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              elevation: 0,
              child: ListTile(
                title: Text('1500ml / 2000ml', style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: Text("06/11/2023 12:06", style: TextStyle(fontSize: 16),),
              ),
            ),
          );
        },
      ),
    );
  }
}
