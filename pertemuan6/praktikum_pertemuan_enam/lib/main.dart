import 'package:flutter/material.dart';

void main() {
  runApp(const TugasPertemuanEnam());
}

class TugasPertemuanEnam extends StatelessWidget {
  const TugasPertemuanEnam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile Mahasiswa"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const FlutterLogo(size: 20),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.only(top: 20),
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     // borderRadius: BorderRadius.circular(10),
              //     image: DecorationImage(
              //       image: AssetImage('assets/img/pp-saya.jpg'),
              //       fit: BoxFit.cover,

              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                width: 300,
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

                    SizedBox(height: 24),
                    textRowCustom("Nama", "Dzulfikar", 18, "bold"),
                    SizedBox(height: 8),
                    textRowCustom("NIM", "2341760071", 16, "normal"),
                    SizedBox(height: 8),
                    textRowCustom(
                      "Jurusan",
                      "Teknik Informatika",
                      16,
                      "normal",
                    ),
                    SizedBox(height: 24),
                    Row(
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
        ),
      ),
    );
  }
}

textRowCustom(String label, String value, int fontSize, String fontWeight) {
  return Text(
    "$label: $value",
    style: TextStyle(
      fontSize: fontSize.toDouble(),
      fontWeight: fontWeight == "bold" ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
