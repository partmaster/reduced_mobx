import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_mobx/reduced_mobx.dart';
import 'package:reduced_mobx/src/inherited_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Incrementer extends Reducer<int> {
  @override
  int call(int state) {
    return state + 1;
  }
}

void main() {
  test('ReducibleStore state 0', () {
    final objectUnderTest = ReducibleStore2(
      0,
      (value) => value,
      (value) => value,
    );
    expect(objectUnderTest.state, 0);
  });

  test('ReducibleStore state 1', () {
    final objectUnderTest = ReducibleStore2(
      1,
      (value) => value,
      (value) => value,
    );
    expect(objectUnderTest.state, 1);
  });

  test('ReducibleStore reduce', () async {
    final objectUnderTest = ReducibleStore2(
      0,
      (value) => value,
      (value) => value,
    );
    objectUnderTest.reduce(Incrementer());
    expect(objectUnderTest.state, 1);
  });

  test('wrapWithProvider', () {
    const child = SizedBox();
    final objectUnderTest = wrapWithProvider2<int, int, int>(
      initialState: 0,
      transformer1: (value) => value.state,
      transformer2: (value) => value.state,
      child: child,
    );
    expect(
      objectUnderTest,
      isA<StatefulInheritedValueWidget<ReducibleStore2<int, int, int>, int>>(),
    );
    final provider = objectUnderTest
        as StatefulInheritedValueWidget<ReducibleStore2<int, int, int>, int>;
    expect(provider.rawValue, 0);
  });

  test('wrapWithConsumer', () {
    final store = ReducibleStore2(
      1,
      (value) => value,
      (value) => value,
    );
    const child = SizedBox();
    final objectUnderTest = store.wrapWithConsumer(
      builder: ({Key? key, required int props}) => child,
      transformer: (reducible) => reducible.state,
    );
    expect(objectUnderTest, isA<Observer>());
  });
}
