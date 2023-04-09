import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rightDice = 3;
  int leftDice = 5;
  int score = 0;

  void changeDices() {
    setState(() {
      rightDice = Random().nextInt(6) + 1;
      leftDice = Random().nextInt(6) + 1;
    });
  }

  void equal() {
    if (rightDice == leftDice) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
        score = 0;
      });
    }
    changeDices();
  }

  void notEqual() {
    if (rightDice != leftDice) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
        score = 0;
      });
    }
    changeDices();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeDices,
      child: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: const Text('dicee'),
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/images/dice${rightDice}.png"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/images/dice${leftDice}.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: equal,
                        child: const Text(
                          'Equal',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
                Expanded(
                    child: TextButton(
                        onPressed: notEqual,
                        child: const Text(
                          'Not Equal',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "Score: $score",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
