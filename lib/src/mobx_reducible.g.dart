// GENERATED CODE - DO NOT MODIFY BY HAND

part of reduced_mobx;

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReducibleStore1<S, P> on ReducibleStoreBase1<S, P>, Store {
  Computed<P>? _$props1Computed;

  @override
  P get props1 => (_$props1Computed ??=
          Computed<P>(() => super.props1, name: 'ReducibleStoreBase1.props1'))
      .value;

  late final _$valueAtom =
      Atom(name: 'ReducibleStoreBase1.value', context: context);

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

  late final _$ReducibleStoreBase1ActionController =
      ActionController(name: 'ReducibleStoreBase1', context: context);

  @override
  void reduce(Reducer<S> reducer) {
    final _$actionInfo = _$ReducibleStoreBase1ActionController.startAction(
        name: 'ReducibleStoreBase1.reduce');
    try {
      return super.reduce(reducer);
    } finally {
      _$ReducibleStoreBase1ActionController.endAction(_$actionInfo);
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

mixin _$ReducibleStore2<S, P1, P2> on ReducibleStoreBase2<S, P1, P2>, Store {
  Computed<P1>? _$props1Computed;

  @override
  P1 get props1 => (_$props1Computed ??=
          Computed<P1>(() => super.props1, name: 'ReducibleStoreBase2.props1'))
      .value;
  Computed<P2>? _$props2Computed;

  @override
  P2 get props2 => (_$props2Computed ??=
          Computed<P2>(() => super.props2, name: 'ReducibleStoreBase2.props2'))
      .value;

  late final _$valueAtom =
      Atom(name: 'ReducibleStoreBase2.value', context: context);

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

  late final _$ReducibleStoreBase2ActionController =
      ActionController(name: 'ReducibleStoreBase2', context: context);

  @override
  void reduce(Reducer<S> reducer) {
    final _$actionInfo = _$ReducibleStoreBase2ActionController.startAction(
        name: 'ReducibleStoreBase2.reduce');
    try {
      return super.reduce(reducer);
    } finally {
      _$ReducibleStoreBase2ActionController.endAction(_$actionInfo);
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
