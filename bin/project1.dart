import 'dart:io';

import 'package:project1/project1.dart' as project1;


const String nama = "Dzul"; // tidak bisa di ubah

void main(List<String> arguments) {
  // print('Hello world: ${project1.calculate()}!');

  // single line
  /*
    multi line
    */

  // constanta dan final
  final String nama2 = 'Muh'; 
  print("Nama saya $nama $nama2");

  // variable
  int umur = 20;
  double tinggi = 140.2;
  bool jenisKelamin = true; // true = laki-laki, false = perempuan
  String alamat = "Jl. Raya";

  stdout.writeln("Umur saya $umur");
  stdout.writeln("Tinggi saya $tinggi");
  stdout.writeln("Jenis kelamin saya ${jenisKelamin ? 'laki-laki' : 'perempuan'}");
  // if (jenisKelamin) {
  //   stdout.writeln("Jenis kelamin saya laki-laki");
  // } else {
  //   stdout.writeln("Jenis kelamin saya perempuan");
  // }
  stdout.writeln("Alamat saya $alamat");
}
