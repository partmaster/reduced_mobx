// consumer.dart

import 'package:flutter/widgets.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

import 'props.dart';
import 'state.dart';
import 'mappers.dart';

typedef _ReducedConsumer<P>
    = ReducedConsumer2<MyAppState, P, MyHomePageProps, MyCounterWidgetProps>;

class MyHomePagePropsConsumer extends StatelessWidget {
  const MyHomePagePropsConsumer({
    super.key,
    required this.builder,
  });

  final WidgetFromPropsBuilder<MyHomePageProps> builder;

  @override
  Widget build(BuildContext context) => _ReducedConsumer(
        mapper: MyHomePagePropsMapper.map,
        builder: builder,
      );
}

class MyCounterWidgetPropsConsumer extends StatelessWidget {
  const MyCounterWidgetPropsConsumer({
    super.key,
    required this.builder,
  });

  final WidgetFromPropsBuilder<MyCounterWidgetProps> builder;

  @override
  Widget build(context) => _ReducedConsumer(
        mapper: MyCounterWidgetPropsMapper.map,
        builder: builder,
      );
}
