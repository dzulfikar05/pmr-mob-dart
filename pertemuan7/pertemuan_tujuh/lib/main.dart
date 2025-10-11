import 'package:flutter/material.dart';

void main() {
  runApp(const GridExample());
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Example')),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Card(
              color: Colors.blue[100],
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
