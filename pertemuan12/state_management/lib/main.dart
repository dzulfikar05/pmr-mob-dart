import 'package:flutter/material.dart';
import 'counter_inherited.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return CounterInherited(
      count: counter,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("InheritedWidget Demo")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Value from InheritedWidget:"),
                Builder(builder: (context) {
                  final data = CounterInherited.of(context).count;
                  return Text(
                    "$data",
                    style: TextStyle(fontSize: 40),
                  );
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => setState(() => counter++),
                  child: Text("Increment"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
