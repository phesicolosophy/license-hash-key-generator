import 'package:flutter/material.dart';
import 'package:licensehash_key_generator/draw.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Generator'),
        ),
        drawer: const Draw(),
        body: Container(
            margin: const EdgeInsets.all(64.0),
            decoration:
                BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(16.0)),
            child: const Center(
                child: Text(
              'Generate license keys\n Generate JWT token',
              style: TextStyle(fontSize: 32.0),
            ))));
  }
}
