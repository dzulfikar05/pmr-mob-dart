import 'package:flutter/material.dart';
import '../models/user_manual.dart';
import 'dart:convert';

class ManualJsonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jsonString =
        '{"name": "Dzulfikar", "email": "dzul@mail.com", "age": "25"}';

    final user = UserManual.fromJson(jsonDecode(jsonString));

    return Scaffold(
      appBar: AppBar(title: Text("Manual JSON Parsing")),
      body: Center(
        child: Text(
          "Nama: ${user.name}\nEmail: ${user.email}\nAge: ${user.age}",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
