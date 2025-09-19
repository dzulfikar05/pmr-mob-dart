import 'dart:io';

int count = 0;
double discount = 0.05;
double calculateDiscount(double total) {
  count += 1;
  double newDiscount = discount * count;
  double discountAmount = total * newDiscount;

  print("");
  return discountAmount;
}

void main(List<String> arguments) {
  double total = 1000000;

  print("total harga awal : $total");
  print("");

  print("total diskon 1: ${calculateDiscount(total)} (${count*discount*100} %)");
  print("total diskon 2: ${calculateDiscount(total)} (${count*discount*100} %)");
  print("total diskon 3: ${calculateDiscount(total)} (${count*discount*100} %)");

  print("total harga akhir : ${total - calculateDiscount(total)}");
}
