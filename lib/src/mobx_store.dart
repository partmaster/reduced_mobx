// mobx_store.dart

library reduced_mobx;

import 'package:flutter/widgets.dart';
import 'inherited_widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:reduced/reduced.dart' as reduced;

part 'mobx_store.g.dart';

class ReducedStore1<S, P1> = ReducedStoreBase1<S, P1> with _$ReducedStore1;

class ReducedStore2<S, P1, P2> = ReducedStoreBase2<S, P1, P2>
    with _$ReducedStore2;

/// Implementation of the [reduced.Store] interface with one props and mixin [Store].
abstract class ReducedStoreBase1<S, P1> extends reduced.Store<S> with Store {
  ReducedStoreBase1(this.value, this.mapper1);

  final reduced.StateToPropsMapper<S, P1> mapper1;

  @observable
  S value;

  @override
  S get state => value;

  @override
  @action
  process(event) => value = event(value);

  @computed
  P1 get props1 => mapper1(this.state, this);
}

/// Implementation of the [ReducedStore] interface with two props and mixin [Store].
abstract class ReducedStoreBase2<S, P1, P2> extends reduced.Store<S>
    with Store {
  ReducedStoreBase2(
    this.value,
    this.mapper1,
    this.mapper2,
  );

  final reduced.StateToPropsMapper<S, P1> mapper1;
  final reduced.StateToPropsMapper<S, P2> mapper2;

  @observable
  S value;

  @override
  get state => value;

  @override
  @action
  process(event) => value = event(value);

  @computed
  P1 get props1 => mapper1(this.state, this);

  @computed
  P2 get props2 => mapper2(this.state, this);
}

extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducedStore1] instance.
  ReducedStore1<S, P1> store1<S, P1>() =>
      InheritedValueWidget.of<ReducedStore1<S, P1>>(this);

  /// Convenience method for getting a [ReducedStore2] instance.
  ReducedStore2<S, P1, P2> store2<S, P1, P2>() =>
      InheritedValueWidget.of<ReducedStore2<S, P1, P2>>(this);
}
