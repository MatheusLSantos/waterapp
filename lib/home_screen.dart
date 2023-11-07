import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsScreen()));
                }, icon: Icon(Icons.settings))
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Olá!',
                        style: TextStyle(
                            fontSize: 32
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
                          FilledButton(onPressed: () {},
                            child: Icon(Icons.water_drop_rounded,size: 40,),
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.all(16),
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
                            style: TextStyle(fontSize: 24),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(""),
                        ),
                      ),
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
