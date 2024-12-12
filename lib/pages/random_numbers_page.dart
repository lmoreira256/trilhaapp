import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  final randomNumberKey = 'random_number';
  final numberClicksKey = 'number_clicks';
  late SharedPreferences storage;

  int? randomNumber = 0;
  int? numberClicks = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      randomNumber = storage.getInt(randomNumberKey);
      numberClicks = storage.getInt(numberClicksKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                randomNumber == null
                    ? 'Nenhum número gerado'
                    : randomNumber.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                numberClicks == null
                    ? 'Nenhum clique efetuado'
                    : numberClicks.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Gerador de números',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();

            setState(() {
              randomNumber = random.nextInt(1000);
              numberClicks = (numberClicks == null ? 0 : numberClicks!) + 1;
            });

            storage.setInt(randomNumberKey, randomNumber!);
            storage.setInt(numberClicksKey, numberClicks!);
          },
        ),
      ),
    );
  }
}
