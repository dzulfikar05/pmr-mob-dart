import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ApiScreen extends StatefulWidget {
  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  Map<String, dynamic>? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("REST API GET")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final data = await ApiService.getUser();
              setState(() => user = data);
            },
            child: Text("Fetch User"),
          ),
          SizedBox(height: 20),
          Text("Data: ${user ?? 'No data'}"),
        ],
      ),
    );
  }
}
