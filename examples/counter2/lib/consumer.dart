// consumer.dart

import 'package:flutter/widgets.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

import 'props.dart';
import 'state.dart';
import 'transformer.dart';

extension _WrapWithConsumer on BuildContext {
  Widget wrapWithConsumer<P>({
    required ReducedTransformer<MyAppState, P> transformer,
    required ReducedWidgetBuilder<P> builder,
  }) =>
      store2<MyAppState, MyHomePageProps, MyCounterWidgetProps>()
          .wrapWithConsumer(transformer: transformer, builder: builder);
}

class MyHomePagePropsConsumer extends StatelessWidget {
  const MyHomePagePropsConsumer({
    super.key,
    required this.builder,
  });

  final ReducedWidgetBuilder<MyHomePageProps> builder;

  @override
  Widget build(BuildContext context) => context.wrapWithConsumer(
        transformer: transformMyHomePageProps,
        builder: builder,
      );
}

class MyCounterWidgetPropsConsumer extends StatelessWidget {
  const MyCounterWidgetPropsConsumer({
    super.key,
    required this.builder,
  });

  final ReducedWidgetBuilder<MyCounterWidgetProps> builder;

  @override
  Widget build(context) => context.wrapWithConsumer(
        transformer: transformMyCounterWidgetProps,
        builder: builder,
      );
}
