import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メイン画面'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(150, 150),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        '得点！',
                        style: TextStyle(fontSize: 29, color: Colors.yellow),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(150, 150),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'ファール',
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
