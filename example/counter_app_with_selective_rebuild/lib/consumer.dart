// consumer.dart

import 'package:flutter/widgets.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

import 'props.dart';
import 'state.dart';
import 'transformer.dart';

typedef _ReducedConsumer<P>
    = ReducedConsumer2<MyAppState, P, MyHomePageProps, MyCounterWidgetProps>;

class MyHomePagePropsConsumer extends StatelessWidget {
  const MyHomePagePropsConsumer({
    super.key,
    required this.builder,
  });

  final ReducedWidgetBuilder<MyHomePageProps> builder;

  @override
  Widget build(BuildContext context) => _ReducedConsumer(
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
  Widget build(context) => _ReducedConsumer(
        transformer: transformMyCounterWidgetProps,
        builder: builder,
      );
}
