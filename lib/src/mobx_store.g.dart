// GENERATED CODE - DO NOT MODIFY BY HAND

part of reduced_mobx;

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReducedStore1<S, P1> on ReducedStoreBase1<S, P1>, Store {
  Computed<P1>? _$props1Computed;

  @override
  P1 get props1 => (_$props1Computed ??=
          Computed<P1>(() => super.props1, name: 'ReducedStoreBase1.props1'))
      .value;

  late final _$valueAtom =
      Atom(name: 'ReducedStoreBase1.value', context: context);

  @override
  S get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(S value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$ReducedStoreBase1ActionController =
      ActionController(name: 'ReducedStoreBase1', context: context);

  @override
  void dispatch(Event<S> event) {
    final _$actionInfo = _$ReducedStoreBase1ActionController.startAction(
        name: 'ReducedStoreBase1.dispatch');
    try {
      return super.dispatch(event);
    } finally {
      _$ReducedStoreBase1ActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
props1: ${props1}
    ''';
  }
}

mixin _$ReducedStore2<S, P1, P2> on ReducedStoreBase2<S, P1, P2>, Store {
  Computed<P1>? _$props1Computed;

  @override
  P1 get props1 => (_$props1Computed ??=
          Computed<P1>(() => super.props1, name: 'ReducedStoreBase2.props1'))
      .value;
  Computed<P2>? _$props2Computed;

  @override
  P2 get props2 => (_$props2Computed ??=
          Computed<P2>(() => super.props2, name: 'ReducedStoreBase2.props2'))
      .value;

  late final _$valueAtom =
      Atom(name: 'ReducedStoreBase2.value', context: context);

  @override
  S get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(S value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$ReducedStoreBase2ActionController =
      ActionController(name: 'ReducedStoreBase2', context: context);

  @override
  void dispatch(Event<S> event) {
    final _$actionInfo = _$ReducedStoreBase2ActionController.startAction(
        name: 'ReducedStoreBase2.dispatch');
    try {
      return super.dispatch(event);
    } finally {
      _$ReducedStoreBase2ActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
props1: ${props1},
props2: ${props2}
    ''';
  }
}
