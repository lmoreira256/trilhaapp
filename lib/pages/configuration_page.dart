import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String? userName;
  double? height;
  bool receivePushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    userNameController.text = await storage.getUserName();
    heightController.text = storage.getHeigth().toString();
    receivePushNotification = await storage.getReceiveNotification();
    darkTheme = await storage.getDarkMode();

    setState(() {});
  }

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
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage
                        .setHeight(double.tryParse(heightController.text) ?? 0);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Meu App'),
                            content:
                                const Text('Favor informar uma altura válida!'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });

                    return;
                  }
                  await storage.setUserName(userNameController.text);
                  await storage.setReceiveNotification(receivePushNotification);
                  await storage.setDarkMode(darkTheme);
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
