import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject3/configs/app_settings.dart';
import 'settings_screen.dart';
import 'package:lottie/lottie.dart';
import 'water_intake_history.dart';
import 'components/water_selection.dart';
import 'components/random_tip_generator.dart';

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

  String _tipText = '';

  @override
  void initState() {
    super.initState();
    _updateTipText();
  }

  void _updateTipText() {
    setState(() {
      _tipText = RandomTipGenerator.getRandomTip();
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateTipText(); // Atualiza o texto cada vez que a tela é construída
    Future<String> _name = context.read<AppSettings>().getName();
    Future<double> _intakeGoal = context.read<AppSettings>().getIntakeGoal();
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
                        child: FutureBuilder<String>(
                          future: _name,
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                            if (snapshot.hasData) {
                              return Text('${snapshot.data!}!', style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                        )
                    ),
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
                      child: Text(_tipText),
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
                          FutureBuilder<double>(
                            future: _intakeGoal,
                            builder: (BuildContext context, AsyncSnapshot<double> snapshot){
                              if (snapshot.hasData) {
                                return Text("1500ml/${snapshot.data!.round()}ml", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),);
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
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

