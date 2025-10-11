import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman About')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}