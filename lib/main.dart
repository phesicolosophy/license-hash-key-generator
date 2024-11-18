import 'package:flutter/material.dart';
import 'package:licensehash_key_generator/about_page.dart';
import 'package:licensehash_key_generator/error_page.dart';
import 'package:licensehash_key_generator/home_page.dart';
import 'package:licensehash_key_generator/jwt_token_generator.dart';
import 'package:licensehash_key_generator/license_hash_key_generator.dart';

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
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/license-key': (BuildContext context) => const LicenseHashKeyGenerator(),
        '/jwt-token': (BuildContext context) => const JWTTokenGenerator(),
        '/about': (BuildContext context) => const AboutPage(),
        '/error': (BuildContext context) => const ErrorPage(),
      },
    );
  }
}
