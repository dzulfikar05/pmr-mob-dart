import 'dart:io';

void main(List<String> arguments) {
  var barang = {
    'kode':[],
    'nama':[],
    'harga':[],
  };

  barang['kode']!.add("B001");
  barang['nama']!.add("pensil");
  barang['harga']!.add(2000);

  barang['kode']!.add("B002");
  barang['nama']!.add("pulpen");
  barang['harga']!.add(3000);

  barang['kode']!.add("B003");
  barang['nama']!.add("buku");
  barang['harga']!.add(5000);
  
  barang['kode']!.add("B004");
  barang['nama']!.add("penghapus");
  barang['harga']!.add(3000);

  print(barang);

}
