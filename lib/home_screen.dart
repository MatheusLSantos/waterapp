import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'package:lottie/lottie.dart';
import 'water_intake_history.dart';
import 'components/water_selection.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showWaterSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WaterSeleciton(
          onButtonPressed: (int buttonIndex) {},
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
          'assets/backgroundfish_ani.json',
          fit: BoxFit.cover,
        ),
        Scaffold(
            extendBodyBehindAppBar: false,
            backgroundColor: Colors.transparent,

            body: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("Olá,",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsScreen()));
                        }, icon: Icon(Icons.settings)),
                      ],
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: Text("Fulano!", style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text('Curiosidade:',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text('A maior reserva de água doce do mundo está localizada no Brasil, com 6.950 quilômetros cúbicos do líquido.'),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Lottie.asset('assets/waterbar3_ani.json',
                            fit: BoxFit.cover),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilledButton(onPressed: () {_showWaterSelection(context);},
                            child: Container(
                              height: 70,
                              width: 70,
                              child: Lottie.asset('assets/waterdrop_ani.json',
                                  fit: BoxFit.cover),
                            ),
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              shape: CircleBorder(),
                            ),
                          ),
                          Container(
                            child: Text(
                              '1500'
                                  'ml'
                                  ' / '
                                  '2000'
                                  'ml',
                              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text('Histórico:',
                            style: TextStyle(
                                fontSize: 20
                            ),),
                        ],
                      ),
                      Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Container(
                                child: Text("")),
                          )
                      ),
                      FilledButton(onPressed: (){
                        // Navegar para a tela de alteração de peso (WeightScreen)
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WaterIntakeHistory()));
                      },
                        child: Text("Visualizar histórico completo"),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ],
    );
  }
}

