import 'package:flutter/material.dart';

void main() {
  runApp(const StylingExample());
}

class StylingExample extends StatelessWidget {
  const StylingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Styling dan Positioning')),
        body: Stack(
          children: [
            Container(color: Colors.lightBlueAccent),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Text(
                  'Tengah Layar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
