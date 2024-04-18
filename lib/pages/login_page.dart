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
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 5,
                    child: Image.network(
                      'https://hermes.digitalinnovation.one/assets/diome/logo.png',
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Já tem cadastro?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Faça seu login e make the change_',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
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
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: -5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: -5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                height: 30,
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
