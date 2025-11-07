import 'package:flutter/material.dart';
import 'models/counter_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterModel counter = CounterModel(); // <-- Controller pakai model

  void _increment() {
    setState(() {
      counter.increment();
    });
  }

  void _reset() {
    setState(() {
      counter.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MVC Counter Example")),
      body: Center(
        child: Text(
          'Nilai Counter: ${counter.value}',
          style: const TextStyle(fontSize: 28),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _reset,
            backgroundColor: Colors.red,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
