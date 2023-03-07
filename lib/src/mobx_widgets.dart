// mobx_widgets.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'inherited_widgets.dart';
import 'package:reduced/reduced.dart';

import 'mobx_store.dart';

class ReducedProvider1<S, P1> extends StatelessWidget {
  const ReducedProvider1({
    super.key,
    required this.initialState,
    required this.transformer1,
    required this.child,
  });

  final S initialState;
  final ReducedTransformer<S, P1> transformer1;
  final Widget child;

  @override
  Widget build(BuildContext context) => StatefulInheritedValueWidget(
        converter: (rawValue) => ReducedStore1(
          rawValue,
          transformer1,
        ),
        rawValue: initialState,
        child: child,
      );
}

class ReducedProvider2<S, P1, P2> extends StatelessWidget {
  const ReducedProvider2({
    super.key,
    required this.initialState,
    required this.transformer1,
    required this.transformer2,
    required this.child,
  });

  final S initialState;
  final ReducedTransformer<S, P1> transformer1;
  final ReducedTransformer<S, P2> transformer2;
  final Widget child;

  @override
  Widget build(BuildContext context) => StatefulInheritedValueWidget(
        converter: (rawValue) => ReducedStore2(
          rawValue,
          transformer1,
          transformer2,
        ),
        rawValue: initialState,
        child: child,
      );
}

class ReducedConsumer1<S, P1> extends StatelessWidget {
  const ReducedConsumer1({
    super.key,
    required this.transformer,
    required this.builder,
  });

  final ReducedTransformer<S, P1> transformer;
  final ReducedWidgetBuilder<P1> builder;

  @override
  Widget build(BuildContext context) => _build(context.store1<S, P1>());

  Widget _build(ReducedStore1<S, P1> store) => Observer(
        builder: (_) => builder(props: transformer(store)),
      );
}

class ReducedConsumer2<S, P, P1, P2> extends StatelessWidget {
  const ReducedConsumer2({
    super.key,
    required this.transformer,
    required this.builder,
  });

  final ReducedTransformer<S, P> transformer;
  final ReducedWidgetBuilder<P> builder;

  @override
  Widget build(BuildContext context) => _build(context.store2<S, P1, P2>());

  Widget _build(ReducedStore2<S, P1, P2> store) => Observer(
        builder: (_) => builder(props: transformer(store)),
      );
}
