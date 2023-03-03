// mobx_reducible.dart

library reduced_mobx;

import 'package:flutter/widgets.dart';
import 'inherited_widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:reduced/reduced.dart';

part 'mobx_reducible.g.dart';

class ReducibleStore1<S, P1> = ReducibleStoreBase1<S, P1>
    with _$ReducibleStore1;

class ReducibleStore2<S, P1, P2> = ReducibleStoreBase2<S, P1, P2>
    with _$ReducibleStore2;

/// Implementation of the [Reducible] interface with one props and mixin [Store].
abstract class ReducibleStoreBase1<S, P1> extends Reducible<S> with Store {
  ReducibleStoreBase1(
    this.value,
    this.transformer1,
  );

  final ReducedTransformer<S, P1> transformer1;

  @observable
  S value;

  @override
  S get state => value;

  @override
  @action
  reduce(reducer) => value = reducer(value);

  @computed
  P1 get props1 => transformer1(this);
}

/// Implementation of the [Reducible] interface with two props and mixin [Store].
abstract class ReducibleStoreBase2<S, P1, P2> extends Reducible<S> with Store {
  ReducibleStoreBase2(
    this.value,
    this.transformer1,
    this.transformer2,
  );

  final ReducedTransformer<S, P1> transformer1;
  final ReducedTransformer<S, P2> transformer2;

  @observable
  S value;

  @override
  get state => value;

  @override
  @action
  reduce(reducer) => value = reducer(value);

  @computed
  P1 get props1 => transformer1(this);

  @computed
  P2 get props2 => transformer2(this);
}

extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducibleStore1] instance.
  ReducibleStore1<S, P1> store1<S, P1>() =>
      InheritedValueWidget.of<ReducibleStore1<S, P1>>(this);

  /// Convenience method for getting a [ReducibleStore2] instance.
  ReducibleStore2<S, P1, P2> store2<S, P1, P2>() =>
      InheritedValueWidget.of<ReducibleStore2<S, P1, P2>>(this);
}
