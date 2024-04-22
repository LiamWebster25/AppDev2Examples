import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int dice1 = Random().nextInt(6) + 1;
int dice2 = Random().nextInt(6) + 1;
int total = dice1 + dice2;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      total = dice1 + dice2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("The sum is: ${total}"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/dice${dice1}.png', height: 100),
                  Image.asset('assets/dice${dice2}.png', height: 100),
                ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              rollDice();
            }, child: Text('Roll Dice'))
          ],
        )
      )
    );
  }
}
