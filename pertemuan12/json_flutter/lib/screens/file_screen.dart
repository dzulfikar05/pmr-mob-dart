import 'package:flutter/material.dart';
import '../services/file_service.dart';

class FileScreen extends StatefulWidget {
  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filesystem JSON")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await FileService.saveData({"name": "Andi", "age": 21});
              setState(() => content = "Saved!");
            },
            child: Text("Save File"),
          ),
          ElevatedButton(
            onPressed: () async {
              final data = await FileService.readData();
              setState(() => content = data.toString());
            },
            child: Text("Read File"),
          ),
          SizedBox(height: 20),
          Text("Content: $content"),
        ],
      ),
    );
  }
}
