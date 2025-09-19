import 'dart:io';

import 'package:pertemuan4/pertemuan4.dart' as pertemuan4;

void main(List<String> arguments) {
  // // print('Hello world: ${pertemuan4.calculate()}!');

  // var fl = List<int>.filled(4, 2);

  // fl[0] = 1;
  // fl[1] = 2;
  // fl[2] = 3;
  // fl[3] = 4;
  // // fl[4] = 5;

  // // cetak
  // stdout.writeln(fl);

  // var gl = [1, 2, 3];
  // gl.add(4);
  // gl.remove(1);

  // stdout.writeln(gl);

  // var setNilai1 = <int>{1, 2, 3, 4};
  // var setNilai2 = <int>{3, 3, 4, 5};

  // print(setNilai2);
  // print(setNilai1);

  // print(setNilai1.union(setNilai2));
  // print(setNilai1.intersection(setNilai2));

  // var setNilai1 = <int>{};
  // var setNilai2 = <int>{1, 2, 3};

  // stdout.writeln("Jumlah Data setNilai1 =");
  // String input = stdin.readLineSync()!;
  // int jumlah = int.parse(input);
  // for (var i = 0; i < jumlah; i++) {
  //   stdout.writeln("Nilai ke-${i + 1}");
  //   String input = stdin.readLineSync()!;
  //   int nilai = int.parse(input);
  //   setNilai1.add(nilai);
  // }

  // print(setNilai1);
  // print(setNilai1.union(setNilai2));
  // print(setNilai1.intersection(setNilai2));
 
 
  var setNilai1 = <String>{};

  stdout.writeln("Jumlah Data setNilai1 =");
  String input = stdin.readLineSync()!;
  int jumlah = (int.tryParse(input ?? '')) ?? 0;

  for (var i = 0; i < jumlah; i++) {
    stdout.writeln("Nilai ke-${i + 1}");
    String? input = stdin.readLineSync();
    String nilai = input ?? '';
    setNilai1.add(nilai);
  }

  print(setNilai1);
  print(setNilai1.elementAt(1));
  
  
}
