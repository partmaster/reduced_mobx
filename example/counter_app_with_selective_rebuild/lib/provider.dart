// provider.dart

import 'package:flutter/widgets.dart';
import 'package:reduced_mobx/reduced_mobx.dart';

import 'state.dart';
import 'transformer.dart';

class MyAppStateProvider extends StatelessWidget {
  const MyAppStateProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ReducedProvider2(
        transformer1: transformMyHomePageProps,
        transformer2: transformMyCounterWidgetProps,
        initialState: MyAppState(title: 'reduced_mobx example'),
        child: child,
      );
}
