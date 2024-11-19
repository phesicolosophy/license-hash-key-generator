import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JWTTokenGenerator extends StatefulWidget {
  const JWTTokenGenerator({super.key});

  @override
  State<JWTTokenGenerator> createState() => _JWTTokenGeneratorState();
}

class _JWTTokenGeneratorState extends State<JWTTokenGenerator> {
  // "iat": 1690000000,
  // "exp": 1692592000,
  final TextEditingController payloadController = TextEditingController(text: '''
{
  "iss": "app_name",
  "app_role": "user_auth"
}
''');
  final TextEditingController secretKeyController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  String? errorText;

  void generate256BitSecret() {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    secretKeyController.text = base64Url.encode(bytes);
    setState(() {});
  }

  void generateJWT() {
    setState(() => errorText = null);
    try {
    Map<String, dynamic> jsonPayload = json.decode(payloadController.text);
    jsonPayload.addAll(
      {
        'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000, // Issued at time
        // 'exp': DateTime.now().add(const Duration(hours: 24)).millisecondsSinceEpoch ~/
            // 1000, // Expiration time
      },
    );
    
      // Define the payload
      final jwt = JWT(jsonPayload);

      // Sign the token using the secret key
      tokenController.text = jwt.sign(SecretKey(secretKeyController.text));
      setState(() {});
    } catch (e) {
      errorText = 'Error generating JWT: $e';
      setState(() {});
    }
  }

  @override
  void dispose() {
    payloadController.dispose();
    secretKeyController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JWT Token Generator')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Payload'),
                const SizedBox(width: 24.0),
                SizedBox(
                  width: 300.0,
                  height: 200.0,
                  child: TextField(
                    controller: payloadController,
                    maxLines: 8,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('secret key'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: secretKeyController,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                IconButton(onPressed: generate256BitSecret, icon: Icon(Icons.security_rounded))
              ],
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(onPressed: generateJWT, child: const Text('Generate')),
            const SizedBox(height: 32.0),
            Row(
              children: [
                const Text('Token'),
                const SizedBox(width: 32.0),
                SizedBox(
                  width: 500.0,
                  height: 150,
                  child: TextField(
                    controller: tokenController,
                    maxLines: 6,
                    readOnly: true,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            if (errorText != null) Text(errorText!)
          ],
        ),
      ),
    );
  }
}
