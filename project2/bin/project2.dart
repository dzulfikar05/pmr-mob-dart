import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  Map data = {};

  for(int i = 1; i <= 5; i++){
    print("Masukkan Nama Mahasiswa $i =");
    String? nama = stdin.readLineSync();
    print("Masukkan Nilai Mahasiswa $i =");
    String? nilai = stdin.readLineSync();
    data[nama] = nilai;
  }

  stdout.writeln("");
  stdout.writeln("== Data Mahasiswa ==");

  data.forEach((key, value) {
    String? predikat = "";

    int nilai = int.tryParse(value ?? '') ?? 0;

    if(nilai >= 80){
      predikat = "A";
    } else if(nilai >= 60 && nilai < 80){
      predikat = "B";
    } else {
      predikat = "C";
    }
    
    stdout.writeln("Nama Mahasiswa = $key, Nilai Mahasiswa = $nilai, Predikat = $predikat");
  });
}
