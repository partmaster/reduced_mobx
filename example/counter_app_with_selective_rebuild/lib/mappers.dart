// mappers.dart

import 'package:reduced/reduced.dart';

import 'props.dart';
import 'events.dart';
import 'state.dart';

class MyHomePagePropsMapper extends MyHomePageProps {
  MyHomePagePropsMapper._(
    MyAppState state,
    EventProcessor<MyAppState> processor,
  ) : super(
          onPressed: EventCarrier(
            processor,
            CounterIncremented.instance,
          ),
          title: state.title,
        );
  static MyHomePageProps map(
    MyAppState state,
    EventProcessor<MyAppState> processor,
  ) =>
      MyHomePagePropsMapper._(state, processor);
}

class MyCounterWidgetPropsMapper extends MyCounterWidgetProps {
  MyCounterWidgetPropsMapper._(
    MyAppState state,
    EventProcessor<MyAppState> processor,
  ) : super(
          counterText: '${state.counter}',
        );
  static MyCounterWidgetProps map(
    MyAppState state,
    EventProcessor<MyAppState> processor,
  ) =>
      MyCounterWidgetPropsMapper._(state, processor);
}
