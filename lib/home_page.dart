import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _numberController = TextEditingController();
  List<Map<String, String>> _licenseKeys = [];

  // Generate a license key and its hash
  String _generateLicenseKey() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(
            4, (_) => List.generate(4, (_) => characters[random.nextInt(characters.length)]).join())
        .join('-');
  }

  String _hashLicenseKey(String licenseKey) {
    var bytes = utf8.encode(licenseKey);
    return sha256.convert(bytes).toString();
  }

  // Generate specified number of license keys
  void _generateLicenseKeys() {
    setState(() {
      int numberOfKeys = int.tryParse(_numberController.text) ?? 0;
      _licenseKeys = List.generate(numberOfKeys, (_) {
        String licenseKey = _generateLicenseKey();
        String hashedKey = _hashLicenseKey(licenseKey);
        return {'licenseKey': licenseKey, 'hash': hashedKey};
      });
    });
  }

  // Copy to clipboard
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  // Todo add a way to verify if the new generated set of keys are not duplication of an old generated set of keys.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LicenseHash Key Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _numberController,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter number of license keys',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _generateLicenseKeys,
                child: const Text('Generate License Keys'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(label: Text('License Key')),
                        DataColumn(label: Text('Hash')),
                      ],
                      rows: List.generate(
                        _licenseKeys.length,
                        (int index) => DataRow(
                          cells: [
                            DataCell(
                              Text(_licenseKeys[index]['licenseKey'] ?? ''),
                              onTap: () {
                                final String? toClipBoard = _licenseKeys[index]['licenseKey'];
                                if (toClipBoard == null) return;
                                _copyToClipboard(toClipBoard);
                              },
                            ),
                            DataCell(
                              Text(_licenseKeys[index]['hash'] ?? ''),
                              onTap: () {
                                final String? toClipBoard = _licenseKeys[index]['hash'];
                                if (toClipBoard == null) return;
                                _copyToClipboard(toClipBoard);
                              },
                            )
                          ],
                        ),
                      )
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed:
                        _licenseKeys.isEmpty ? null : () => setState(() => _licenseKeys.clear()),
                    tooltip: 'clear table',
                    icon: const Icon(Icons.clear),
                  ),
                  IconButton(
                    onPressed: _licenseKeys.isEmpty
                        ? null
                        : () {
                            final String toClipBoard = _licenseKeys.join('\n');
                            _copyToClipboard(toClipBoard);
                          },
                    tooltip: 'copy table to clipboard',
                    icon: const Icon(Icons.copy),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
