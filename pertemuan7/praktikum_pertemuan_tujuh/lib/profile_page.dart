import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mataKuliah = [
      'Metodologi Penelitian',
      'Audit Sistem Informasi',
      'Manajemen Rantai Pasok',
      'Perencanaan Sumber Daya',
      'Kecerdasan Bisnis',
      'Penjaminan Mutu Perangkat Lunak',
      'Pemrograman Mobile',
      'Manajemen Proyek Sistem Informasi',
      'Keselamatan dan Kesehatan Kerja',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Mahasiswa'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dzulfikar Muhammad Al Ghifari',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Mahasiswa Angkatan 2023'),
                    Text('Prodi Sistem Informasi Bisnis'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mata Kuliah Semester 5:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading:
                        Icon(Icons.book_outlined, color: Colors.indigo),
                    title: Text(mataKuliah[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
