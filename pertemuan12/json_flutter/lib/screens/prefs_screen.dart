import 'package:flutter/material.dart';
import '../services/prefs_service.dart';

class PrefsScreen extends StatefulWidget {
  @override
  State<PrefsScreen> createState() => _PrefsScreenState();
}

class _PrefsScreenState extends State<PrefsScreen> {
  String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await PrefsService.saveToken("123456TOKEN");
              setState(() => token = "Saved!");
            },
            child: Text("Save Token"),
          ),
          ElevatedButton(
            onPressed: () async {
              final t = await PrefsService.getToken();
              setState(() => token = t);
            },
            child: Text("Get Token"),
          ),
          SizedBox(height: 20),
          Text("Token: $token"),
        ],
      ),
    );
  }
}
