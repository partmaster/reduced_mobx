import 'package:flutter_test/flutter_test.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

class Incrementer extends Reducer<int> {
  @override
  int call(int state) => state + 1;
}

void main() {
  test('ReducibleStore state 0', () {
    final objectUnderTest = ReducedStore2(
      0,
      (value) => value,
      (value) => value,
    );
    expect(objectUnderTest.state, 0);
  });

  test('ReducibleStore state 1', () {
    final objectUnderTest = ReducedStore2(
      1,
      (value) => value,
      (value) => value,
    );
    expect(objectUnderTest.state, 1);
  });

  test('ReducibleStore reduce', () async {
    final objectUnderTest = ReducedStore2(
      0,
      (value) => value,
      (value) => value,
    );
    objectUnderTest.reduce(Incrementer());
    expect(objectUnderTest.state, 1);
  });
}
