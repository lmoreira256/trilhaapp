import 'package:flutter/material.dart';

class RegistrationDataPage extends StatelessWidget {
  final String text;

  const RegistrationDataPage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: const Center(
        child: Text('Registration Data Page'),
      ),
    );
  }
}
