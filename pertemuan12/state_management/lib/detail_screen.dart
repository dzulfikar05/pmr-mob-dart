import 'package:flutter/material.dart';
import 'counter_provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = CounterProvider.of(context); // pakai state yang sama

    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen")),
      body: Center(
        child: Text(
          "Counter from Provider: ${model.count}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
