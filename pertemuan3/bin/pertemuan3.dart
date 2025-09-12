import 'dart:io';

import 'package:pertemuan3/pertemuan3.dart' as pertemuan3;

void main(List<String> arguments) {
  // print('Hello world: ${pertemuan3.calculate()}!');

  // int nilai = 75;

  stdout.write("Masukkan Nilai =");
  String? input=stdin.readLineSync();
  int? nilai = int.tryParse(input ?? '') ?? 0;
  
  // String tmp = input ?? '';
  // int? nilai = int.tryParse(tmp)??0;

  // String tmp;
  // if(input == null){
  //   tmp = '';
  // } else {
  //   tmp = input;
  // }

  // int nilai = int.tryParse(tmp) ?? 0;

  // String? input = stdin.readLineSync();
  // dynamic nilai = int.tryParse(input ?? '');


  if((nilai>75) && (nilai<=100)){
    print("Nilai A");
  }else if((nilai>=60) && (nilai <=74)){
    print("Nilai B");
  }else if((nilai >=0) && (nilai <= 59)){
    print("Nilai adalah C");
  }else{
    print("Maaf, nilai tidak benar !!");
  }


  // if tradisional
  String  status;
  if(nilai >= 60){
    status = "lulus";
  }else{
    status = "tidak lulus";
  }

  print(status);

  String status1=(nilai>=60) ? "Lulus" : "Tidak Lulus";
  print(status1);
}
