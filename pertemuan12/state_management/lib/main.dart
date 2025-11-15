import 'package:flutter/material.dart';
import 'counter_model.dart';
import 'counter_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CounterModel model = CounterModel();

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: model,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("InheritedNotifier Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${model.count}", style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: model.increment,
              child: Text("Increment"),
            )
          ],
        ),
      ),
    );
  }
}
