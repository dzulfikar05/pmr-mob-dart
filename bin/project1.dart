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
  stdout.writeln(
      "Jenis kelamin saya ${jenisKelamin ? 'laki-laki' : 'perempuan'}");
  // if (jenisKelamin) {
  //   stdout.writeln("Jenis kelamin saya laki-laki");
  // } else {
  //   stdout.writeln("Jenis kelamin saya perempuan");
  // }
  stdout.writeln("Alamat saya $alamat");

  num nilai = 90.5; //bisa di isi dengan angka atau double
  stdout.writeln("Nilai saya $nilai");

  dynamic bebas = "16";
  stdout.writeln("Nilai dari dynamic adalah $bebas");

  // String angka1 = "15";
  // int angka2 = int.parse(angka1);
  // int angka3 = bebas;

  // List atau array
  List<String> hobby = ["membaca", "menulis", "menggambar"];
  hobby.add("mendengarkan musik");
  stdout.writeln("Hobby saya $hobby");

  Map<String, String> data = {
    "nama": "Dzul",
    "alamat": "Jl. Raya malang",
    "jenis_kelamin": "Laki-laki"
  };

  data['pekerjaan'] = "Programmer";
  data.addAll({"umur": "20"});
  stdout.writeln("Data : $data");
  stdout.writeln("Nama saya ${data['nama']}");
  stdout.writeln("Alamat saya ${data['alamat']}");
  stdout.writeln("Jenis kelamin saya ${data['jenis_kelamin']}");

  try {
    // Code that might throw an exception
    int result = 10 ~/ 0; // This will throw an IntegerDivisionByZeroException
    print("Result: $result");
  } on IntegerDivisionByZeroException {
    // Handles the specific IntegerDivisionByZeroException
    print("Cannot divide by zero!");
  } catch (e) {
    // Handles any other type of exception and provides the exception object
    print("An unexpected error occurred: $e");
  } finally {
    // Code that always executes, regardless of whether an exception occurred
    print("Execution complete.");
  }
}
