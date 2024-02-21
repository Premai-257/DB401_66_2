import 'package:flutter/material.dart';
import 'Report.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/cloud.gif'),
                        fit: BoxFit.cover)),
                child: const Report())),
        theme: ThemeData(
            textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 20, color: Colors.white70),
          displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            color: Colors.lightGreenAccent,
          ),
          displaySmall: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: Colors.yellow,
          ),
        )));
  }
}
