// mobx_wrapper.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'inherited_widgets.dart';
import 'package:reduced/reduced.dart';

import 'mobx_reducible.dart';

Widget wrapWithProvider1<S, P1>({
  required S initialState,
  required ReducedTransformer<S, P1> transformer1,
  required Widget child,
}) =>
    StatefulInheritedValueWidget(
      converter: (rawValue) => ReducibleStore1(
        rawValue,
        transformer1,
      ),
      rawValue: initialState,
      child: child,
    );

Widget wrapWithProvider2<S, P1, P2>({
  required S initialState,
  required ReducedTransformer<S, P1> transformer1,
  required ReducedTransformer<S, P2> transformer2,
  required Widget child,
}) =>
    StatefulInheritedValueWidget(
      converter: (rawValue) => ReducibleStore2(
        rawValue,
        transformer1,
        transformer2,
      ),
      rawValue: initialState,
      child: child,
    );

extension WrapWithConsumer1<S, P1> on ReducibleStore1<S, P1> {
  Widget wrapWithConsumer<P>({
    required ReducedTransformer<S, P> transformer,
    required ReducedWidgetBuilder<P> builder,
  }) =>
      Observer(builder: (_) => builder(props: transformer(this)));
}

extension WrapWithConsumer2<S, P1, P2> on ReducibleStore2<S, P1, P2> {
  Widget wrapWithConsumer<P>({
    required ReducedTransformer<S, P> transformer,
    required ReducedWidgetBuilder<P> builder,
  }) =>
      Observer(builder: (_) => builder(props: transformer(this)));
}
