import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(64.0),
          padding: const EdgeInsets.all(32.0),
          height: 300,
          decoration:
              BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(16.0)),
          child: const Column(
            children: [
              Text('License Key Generator'),
              Text('version 0.2.0'),
              Divider(),
              SizedBox(height: 32.0),
              Text(
                  'Generate license keys and hashes, Generate JWT token from playload and secret key'),
              SizedBox(height: 32.0),
              Text('License MIT'),
            ],
          ),
        ),
      ),
    );
  }
}
