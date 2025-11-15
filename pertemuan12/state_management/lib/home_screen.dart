import 'package:flutter/material.dart';
import 'counter_provider.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = CounterProvider.of(context); // ambil state

    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: ${model.count}",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: model.increment,
              child: Text("Increment"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailScreen()),
                );
              },
              child: Text("Go to Detail Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
