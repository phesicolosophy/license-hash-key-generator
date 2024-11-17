import 'package:flutter/material.dart';
import 'package:licensehash_key_generator/home_page.dart';

void main() {
  runApp(const LicenseHashKeyGeneratorApp());
}

class LicenseHashKeyGeneratorApp extends StatelessWidget {
  const LicenseHashKeyGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LicenseHash Key Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
