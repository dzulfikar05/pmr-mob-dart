void main(List<String> arguments) {
  var mahasiswa = ['abdul', 'zaki', 'joko'];
  print(mahasiswa.length);

  mahasiswa.add("dono");
  mahasiswa.add("yudi");
  print(mahasiswa.length);

  mahasiswa.remove("abdul");
  print(mahasiswa.length);
}
