import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final USER_NAME_KEY = 'USER_NAME_KEY';
  final HEIGHT_KEY = 'HEIGHT_KEY';
  final RECEIVE_NOTIFICATION_KEY = 'RECEIVE_NOTIFICATION_KEY';
  final DARK_MODE_KEY = 'DARK_MODE_KEY';

  late SharedPreferences storage;

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
    storage = await SharedPreferences.getInstance();

    setState(() {
      userNameController.text = storage.getString(USER_NAME_KEY) ?? '';
      heightController.text = (storage.getDouble(HEIGHT_KEY) ?? 0).toString();
      receivePushNotification =
          storage.getBool(RECEIVE_NOTIFICATION_KEY) ?? false;
      darkTheme = storage.getBool(DARK_MODE_KEY) ?? false;
    });
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
                    await storage.setDouble(HEIGHT_KEY,
                        double.tryParse(heightController.text) ?? 0);
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
                  await storage.setString(
                      USER_NAME_KEY, userNameController.text);
                  await storage.setBool(
                      RECEIVE_NOTIFICATION_KEY, receivePushNotification);
                  await storage.setBool(DARK_MODE_KEY, darkTheme);
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
