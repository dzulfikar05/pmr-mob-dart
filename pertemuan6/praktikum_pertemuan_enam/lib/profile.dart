import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/img/pp-saya.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "Foto Profil",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                textRowCustom("Nama", "Dzulfikar", 18, "bold"),
                const SizedBox(height: 8),
                textRowCustom("NIM", "2341760071", 16, "normal"),
                const SizedBox(height: 8),
                textRowCustom(
                  "Jurusan",
                  "Teknik Informatika",
                  16,
                  "normal",
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 24, color: Colors.black54),
                    SizedBox(width: 20),
                    Icon(Icons.phone, size: 24, color: Colors.black54),
                    SizedBox(width: 20),
                    Icon(Icons.public, size: 24, color: Colors.black54),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pindahkan juga fungsi ini ke sini
textRowCustom(String label, String value, int fontSize, String fontWeight) {
  return Text(
    "$label: $value",
    style: TextStyle(
      fontSize: fontSize.toDouble(),
      fontWeight: fontWeight == "bold" ? FontWeight.bold : FontWeight.normal,
    ),
  );
}