// provider.dart

import 'package:flutter/widgets.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

import 'state.dart';
import 'mappers.dart';

class MyAppStateProvider extends StatelessWidget {
  const MyAppStateProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ReducedProvider2(
        mapper1: MyHomePagePropsMapper.map,
        mapper2: MyCounterWidgetPropsMapper.map,
        initialState: MyAppState(title: 'reduced_mobx example'),
        child: child,
      );
}
