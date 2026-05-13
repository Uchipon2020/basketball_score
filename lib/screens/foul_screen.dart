import 'package:flutter/material.dart';

class FoulScreen extends StatefulWidget {
  const FoulScreen({super.key});

  @override
  State<FoulScreen> createState() => _FoulScreenState();
}

class _FoulScreenState extends State<FoulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記録画面'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 80,
        child: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
