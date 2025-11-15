import 'package:flutter/widgets.dart';
import 'counter_model.dart';

class CounterProvider extends InheritedNotifier<CounterModel> {
  const CounterProvider({
    Key? key,
    required CounterModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static CounterModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterProvider>()!
        .notifier!;
  }
}
