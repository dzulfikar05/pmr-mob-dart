import 'dart:io';

void main(List<String> arguments) {
  var setString1 = <String>{};
  var setString2 = <String>{};

  stdout.writeln("Masukkan jumlah data set 1 : ");
  var data1 = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= data1; i++) {
    stdout.writeln("Masukkan data ke-$i set 1 : ");
    setString1.add(stdin.readLineSync()!);
  }

  print("");
  stdout.writeln("Masukkan jumlah data set 2 : ");
  var data2 = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= data2; i++) {
    stdout.writeln("Masukkan data ke-$i set 2 : ");
    setString2.add(stdin.readLineSync()!);
  }

  print("");

  print("Nilai set 1 : ");
  print(setString1);
  print("");

  print("Nilai set 2 : ");
  print(setString2);
  print("");
  print("");

  print("jumlah data union : ");
  print(setString1.union(setString2).length);
  print("");

  print("jumlah data intersection : ");
  print(setString1.intersection(setString2).length);
  print("");
}
