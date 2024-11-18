import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? msg;
  const ErrorPage({this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(msg ?? 'Error Page', style: const TextStyle(fontSize: 48.0))),
    );
  }
}
