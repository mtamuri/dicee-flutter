import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.green,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 15,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
              height: 15,
            ),
            SizedBox(
              height: 65,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Colors.pinkAccent), // Change button color
                  minimumSize: WidgetStateProperty.all(
                      Size(150, 50)), // Change button size (width, height)
                ),
                child: const Text('Generate Dice'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
