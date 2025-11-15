import 'package:flutter/material.dart';
import 'screens/manual_json_screen.dart';
import 'screens/auto_json_screen.dart';
import 'screens/prefs_screen.dart';
import 'screens/file_screen.dart';
import 'screens/encrypt_screen.dart';
import 'screens/api_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MenuScreen(),
  ));
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materi 12 — JSON & Storage")),
      body: ListView(
        children: [
          menuBtn(context, "Manual JSON Parsing", ManualJsonScreen()),
          menuBtn(context, "JSON Serializable", AutoJsonScreen()),
          menuBtn(context, "SharedPreferences", PrefsScreen()),
          menuBtn(context, "Filesystem", FileScreen()),
          menuBtn(context, "Encrypt & Decrypt", EncryptScreen()),
          menuBtn(context, "REST API GET", ApiScreen()),
        ],
      ),
    );
  }

  Widget menuBtn(BuildContext c, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => screen)),
    );
  }
}
