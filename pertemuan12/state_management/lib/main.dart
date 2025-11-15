import 'package:flutter/material.dart';
import 'counter_model.dart';
import 'counter_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterModel counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: counterModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
