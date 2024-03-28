import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.greenAccent,
        ),
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.pacificoTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}
