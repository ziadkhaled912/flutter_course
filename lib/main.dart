import 'package:flutter/material.dart';
import 'package:your_app_name/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xff1A1F38),
          foregroundColor: Colors.white
        ),
      ),
      home: const HomePage(),
    );
  }
}
