import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Icon(
                Icons.person,
                size: 125,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Informe seu email:'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('Email'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Informe sua senha:'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('Senha'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                color: Colors.grey,
                height: 30,
                child: const Text('Botão'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const Text('Cadastro'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
