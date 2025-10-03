import 'package:flutter/material.dart';
import 'dart:ui'; // Penting untuk ImageFilter

void main() {
  runApp(const DzulApp());
}

class DzulApp extends StatefulWidget {
  const DzulApp({super.key});

  @override
  State<DzulApp> createState() => _DzulAppState();
}

class _DzulAppState extends State<DzulApp> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dzul App",
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "DoReMi",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Arial',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 145, 0),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/blur-bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30.0, 
                    sigmaY: 30.0, 
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.3), // Efek overlay transparan
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding: const EdgeInsets.only(top: kToolbarHeight + 12.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        """Do do dododododo... Re re rerererere... Mi mi mimimimimi... Fa fa fafafafafa... 
\n
(Do) doakan ku harus pergi... (Re) relakan aku di sini... (Mi) misalnya aku kan pulang... (Fa) pastikan kau tetap menunggu...
\n
(Sol) soal cinta luar biasa... (La) lama-lama bisa gila... (Si) siapa yang tahu pasti... (Do) doakan aku di ...
\n
Adudududuh duh aku percaya... Kali ini kau pasti bisa, yeah... Kuku kutanya ada yang salah... Jelas ini luar biasa...
\n
(Do) doakan ku harus pergi... (Re) relakan aku di sini... (Mi) misalnya aku kan pulang... (Fa) pastikan kau tetap menunggu...
\n
(Sol) soal cinta luar biasa... (La) lama-lama bisa gila... (Si) siapa yang tahu pasti... (Do) doakan aku di sini...
\n
Everybody sings it!... (Do) doakan ku harus pergi... (Re) relakan aku di sini... (Mi) misalnya aku kan pulang... (Fa) pastikan kau tetap menunggu...
\n
(Sol) soal cinta luar biasa... (La) lama-lama bisa gila... (Si) siapa yang tahu pasti... (Do) doakan aku di sini...""",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 145, 0),
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 150000),
              curve: Curves.easeOut,
            );
          },
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
