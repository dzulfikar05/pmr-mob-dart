import 'package:flutter/widgets.dart';

class CounterInherited extends InheritedWidget {
  final int count;

  const CounterInherited({
    required this.count,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static CounterInherited of(BuildContext context) {
    final CounterInherited? result =
        context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(result != null, 'CounterInherited not found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterInherited old) => old.count != count;
}
