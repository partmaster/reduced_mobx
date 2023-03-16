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
    required this.mapper1,
    required this.child,
  });

  final S initialState;
  final StateToPropsMapper<S, P1> mapper1;
  final Widget child;

  @override
  Widget build(BuildContext context) => StatefulInheritedValueWidget(
        converter: (rawValue) => ReducedStore1(
          rawValue,
          mapper1,
        ),
        rawValue: initialState,
        child: child,
      );
}

class ReducedProvider2<S, P1, P2> extends StatelessWidget {
  const ReducedProvider2({
    super.key,
    required this.initialState,
    required this.mapper1,
    required this.mapper2,
    required this.child,
  });

  final S initialState;
  final StateToPropsMapper<S, P1> mapper1;
  final StateToPropsMapper<S, P2> mapper2;
  final Widget child;

  @override
  Widget build(BuildContext context) => StatefulInheritedValueWidget(
        converter: (rawValue) => ReducedStore2(
          rawValue,
          mapper1,
          mapper2,
        ),
        rawValue: initialState,
        child: child,
      );
}

class ReducedConsumer1<S, P1> extends StatelessWidget {
  const ReducedConsumer1({
    super.key,
    required this.mapper,
    required this.builder,
  });

  final StateToPropsMapper<S, P1> mapper;
  final WidgetFromPropsBuilder<P1> builder;

  @override
  Widget build(BuildContext context) => _build(context.store1<S, P1>());

  Widget _build(ReducedStore1<S, P1> store) => Observer(
        builder: (_) => builder(props: mapper(store.state, store)),
      );
}

class ReducedConsumer2<S, P, P1, P2> extends StatelessWidget {
  const ReducedConsumer2({
    super.key,
    required this.mapper,
    required this.builder,
  });

  final StateToPropsMapper<S, P> mapper;
  final WidgetFromPropsBuilder<P> builder;

  @override
  Widget build(BuildContext context) => _build(context.store2<S, P1, P2>());

  Widget _build(ReducedStore2<S, P1, P2> store) => Observer(
        builder: (_) => builder(props: mapper(store.state, store)),
      );
}
