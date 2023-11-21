import 'package:flutter/material.dart';
import 'package:waterproject3/name_screen.dart';
import 'package:lottie/lottie.dart';
import 'components/switch_theme_toggle.dart';

class SettingsScreen extends StatelessWidget {
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
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Configurações'),
          ),
          body: ListView(
            padding: EdgeInsets.all(24),
            children: [
              Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                elevation: 0,
                child: ListTile(
                  title: Text('Notificações'),
                  trailing: Switch(
                    value: true, // Valor do switch (pode ser alterado conforme necessário)
                    onChanged: (value) {
                      // Lógica para alterar o estado de notificações
                    },
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                elevation: 0,
                child: ListTile(
                  title: Text('Tema Escuro'),
                  trailing: SwitchThemeToggle(),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                elevation: 0,
                child: ListTile(
                  title: Text('Mudar informações'),
                  subtitle: Text('Alterar nome e peso'),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    // Navegar para a tela de alteração de peso (WeightScreen)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NameScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
