import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String? userName;
  double? height;
  bool receivePushNotification = false;
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Nome usuário'),
                  controller: userNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Altura'),
                  controller: heightController,
                ),
              ),
              SwitchListTile(
                title: const Text('Receber Notificações'),
                value: receivePushNotification,
                onChanged: (bool value) {
                  setState(() {
                    receivePushNotification = !receivePushNotification;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Utilizar tema escuro'),
                value: darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    darkTheme = !darkTheme;
                  });
                },
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
