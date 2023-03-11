// events.dart

import 'package:reduced/reduced.dart';

import 'state.dart';

class CounterIncremented extends Event<MyAppState> {
  @override
  call(state) => state.copyWith(counter: state.counter + 1);
}
