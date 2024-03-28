import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/generate_random_number_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var clickQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'O número gerado foi: $generatedNumber',
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
            Text(
              'Foi clicado $clickQuantity vezes!',
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.redAccent,
                    child: const Text('1'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                    child: const Text('2'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.yellowAccent,
                    child: const Text('3'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            clickQuantity++;
            generatedNumber =
                GenerateRandomNumberService().generateRandonNumber(1000);
          });
        },
      ),
    );
  }
}
