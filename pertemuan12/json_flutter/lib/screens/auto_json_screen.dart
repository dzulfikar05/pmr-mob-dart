import 'package:flutter/material.dart';
import '../models/user_auto.dart';
import 'dart:convert';

class AutoJsonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jsonString = '{"name": "dzul", "email": "dzul@mail.com", "age": 30}';

    final user = UserAuto.fromJson(jsonDecode(jsonString));

    return Scaffold(
      appBar: AppBar(title: Text("JSON Serializable")),
      body: Center(
        child: Text(
          "Nama: ${user.name}\nEmail: ${user.email}\nAge: ${user.age}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
