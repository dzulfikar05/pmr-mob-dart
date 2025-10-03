import 'package:flutter/material.dart';
import 'profile.dart'; 
void main() {
  runApp(const TugasPertemuanEnam());
}


class TugasPertemuanEnam extends StatelessWidget {
  const TugasPertemuanEnam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Profile & Counter App"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const FlutterLogo(size: 20),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Profile(),
          ],
        )
      ),
    );
  }
}

textRowCustom(String label, String value, int fontSize, String fontWeight) {
  return Text(
    "$label: $value",
    style: TextStyle(
      fontSize: fontSize.toDouble(),
      fontWeight: fontWeight == "bold" ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
