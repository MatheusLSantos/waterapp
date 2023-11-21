import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/business_logic/waterIntakeByDiary.dart';
import 'package:waterproject3/models/water_intake_model.dart';
import 'package:waterproject3/models/diary_model.dart';
import 'package:waterproject3/repositories/diary_repository.dart';
import 'package:waterproject3/repositories/water_intake_repository.dart';

class WaterIntakeHistory extends StatefulWidget {
  final Function onUpdateHomeScreen;
  const WaterIntakeHistory({Key? key, required this.onUpdateHomeScreen}) : super(key: key);

  @override
  State<WaterIntakeHistory> createState() => _WaterIntakeHistoryState();
}

void onUpdateHomeScreen() {}

class _WaterIntakeHistoryState extends State<WaterIntakeHistory> {
  
  Future<void> _showDeleteConfirmationDialog(BuildContext context, int waterIntakeId, Function() onDelete) async {
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
              onPressed: () async {
                // Lógica para excluir do banco de dados aqui
                await context.read<WaterIntakeRepository>().deleteWaterIntake(waterIntakeId);
                setState(() {});
                onDelete(); // Chama a função de callback após a exclusão
                widget.onUpdateHomeScreen();
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

  String formatDateTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} - ${time.day.toString().padLeft(2, '0')}-${time.month.toString().padLeft(2, '0')}-${time.year}';
  }
  
  Future<List<WaterIntake>> getWaterIntakes(Future<Diary> futureDiary ) async {
    Diary diary = await futureDiary;
    
    return await context.read<DiaryRepository>().waterIntakes(diary.id);
  }

  @override
  Widget build(BuildContext context) {
    Future<Diary> _diary = WaterIntakeByDiary.getDiary(context);
    getWaterIntakes(_diary);
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
          body: FutureBuilder(
            future: getWaterIntakes(_diary),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: snapshot.data!.length,
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
                              Text('${snapshot.data![index].waterIntakeVolume.round()}ml', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                              Text('${formatDateTime(snapshot.data![index].createdAt)}', style: TextStyle(fontSize: 12)),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _showDeleteConfirmationDialog(
                                    context,
                                    snapshot.data![index].id,
                                        () {
                                      // Função de callback que será chamada após a exclusão
                                      setState(() {
                                        onUpdateHomeScreen();
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          ),
        ),
      ],
    );
  }


}
