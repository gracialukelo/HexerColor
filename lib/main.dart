import 'dart:math';
import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backgroundColor = Colors.white;

  void changeColors() {
    List<String> hexNumbers = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F"
    ];

    String hexColor = "0xFF";

    Random random = Random();

    for (var i = 0; i < 6; i++) {
      int randomIndex = random.nextInt(hexNumbers.length);
      hexColor += hexNumbers[randomIndex];
    }

    setState(() {
      backgroundColor = Color(int.parse(hexColor));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Klicken Sie unten auf die Schaltfläche, um den Hexadezimalcode der zufälligen Farbe anzuzeigen.",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Der Hexadezimalcode der Farbe lautet:",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              backgroundColor.toString(),
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeColors();
        },
        tooltip: 'Ändern',
        child: Icon(Icons.add),
      ),
    );
  }
}
