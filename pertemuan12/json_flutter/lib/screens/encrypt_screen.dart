import 'package:flutter/material.dart';
import '../services/crypto_service.dart';

class EncryptScreen extends StatefulWidget {
  @override
  State<EncryptScreen> createState() => _EncryptScreenState();
}

class _EncryptScreenState extends State<EncryptScreen> {
  String? encrypted;
  String? decrypted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Encrypt & Decrypt")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final e = CryptoService.encrypt("Hello World");
              setState(() => encrypted = e);
            },
            child: Text("Encrypt"),
          ),
          ElevatedButton(
            onPressed: () {
              if (encrypted != null) {
                final d = CryptoService.decrypt(encrypted!);
                setState(() => decrypted = d);
              }
            },
            child: Text("Decrypt"),
          ),
          SizedBox(height: 20),
          Text("Encrypted: $encrypted"),
          Text("Decrypted: $decrypted"),
        ],
      ),
    );
  }
}
