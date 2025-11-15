import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners(); // memberi tahu UI untuk update
  }
}
