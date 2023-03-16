![GitHub release (latest by date)](https://img.shields.io/github/v/release/partmaster/reduced_mobx)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/partmaster/reduced_mobx/dart.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/partmaster/reduced_mobx)
![GitHub last commit](https://img.shields.io/github/last-commit/partmaster/reduced_mobx)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/partmaster/reduced_mobx)
# reduced_mobx

Implementation of the 'reduced' API for the 'mobx' state management framework with following features:

1. Implementation of the ```Store``` interface 
2. Extension on the ```BuildContext``` for convenient access to the  ```Store``` instance.
3. Register a state for management.
4. Trigger a rebuild on widgets selectively after a state change.

## Features

#### 1. Implementation of the ```Store``` interface 

```dart
class ReducedStore1<S, P1> = ReducedStoreBase1<S, P1>
    with _$ReducedStore1;
```

```dart
abstract class ReducedStoreBase1<S, P1> extends reduced.Store<S>
    with Store {
  ReducedStoreBase1(this.value, this.transformer1);

  final reduced.StateToPropsMapper<S, P1> transformer1;

  @observable
  S value;

  @override
  S get state => value;

  @override
  @action
  process(event) => value = event(value);

  @computed
  P1 get props1 => transformer1(this.state, this);
}
```

#### 2. Extension on the ```BuildContext``` for convenient access to the  ```Store``` instance.

```dart
extension ExtensionStoreOnBuildContext on BuildContext {
  ReducedStore1<S, P1> store1<S, P1>() =>
      InheritedValueWidget.of<ReducedStore1<S, P1>>(this);
}
```

#### 3. Register a state for management.

```dart
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
```

#### 4. Trigger a rebuild on widgets selectively after a state change.

```dart
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
```

## Getting started

In the pubspec.yaml add dependencies on the package 'reduced' and on the package 'reduced_mobx'.

```
dependencies:
  reduced: 0.4.0
  reduced_mobx: 
    git:
      url: https://github.com/partmaster/reduced_mobx.git
      ref: v0.4.0
```

Import package 'reduced' to implement the logic.

```dart
import 'package:reduced/reduced.dart';
```

Import package 'reduced_mobx' to use the logic.

```dart
import 'package:reduced_mobx/reduced_mobx.dart';
```

## Usage

Implementation of the counter demo app logic with the 'reduced' API without further dependencies on state management packages.

```dart
// logic.dart

import 'package:flutter/material.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced/callbacks.dart';

class CounterIncremented extends Event<int> {
  @override
  int call(int state) => state + 1;
}

class Props {
  const Props({required this.counterText, required this.onPressed});

  final String counterText;
  final VoidCallable onPressed;
}

class PropsMapper extends Props {
  PropsMapper(int state, EventProcessor<int> processor)
      : super(
          counterText: '$state',
          onPressed: EventCarrier(processor, CounterIncremented()),
        );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.props});

  final Props props;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('reduced_mobxx example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(props.counterText),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: props.onPressed,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
```

Finished counter demo app using logic.dart and 'reduced_mobx' package:

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:reduced_mobx/reduced_mobx.dart';
import 'logic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ReducedProvider1(
        initialState: 0,
        mapper1: PropsMapper.new,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const ReducedConsumer1(
            mapper: PropsMapper.new,
            builder: MyHomePage.new,
          ),
        ),
      );
}
```

# Additional information

Implementations of the 'reduced' API are available for the following state management frameworks:

|framework|implementation package for 'reduced' API|
|---|---|
|[Binder](https://pub.dev/packages/binder)|[reduced_binder](https://github.com/partmaster/reduced_binder)|
|[Bloc](https://bloclibrary.dev/#/)|[reduced_bloc](https://github.com/partmaster/reduced_bloc)|
|[FlutterCommand](https://pub.dev/packages/flutter_command)|[reduced_fluttercommand](https://github.com/partmaster/reduced_fluttercommand)|
|[FlutterTriple](https://pub.dev/packages/flutter_triple)|[reduced_fluttertriple](https://github.com/partmaster/reduced_fluttertriple)|
|[GetIt](https://pub.dev/packages/get_it)|[reduced_getit](https://github.com/partmaster/reduced_getit)|
|[GetX](https://pub.dev/packages/get)|[reduced_getx](https://github.com/partmaster/reduced_getx)|
|[MobX](https://pub.dev/packages/mobx)|[reduced_mobx](https://github.com/partmaster/reduced_mobx)|
|[Provider](https://pub.dev/packages/provider)|[reduced_provider](https://github.com/partmaster/reduced_provider)|
|[Redux](https://pub.dev/packages/redux)|[reduced_redux](https://github.com/partmaster/reduced_redux)|
|[Riverpod](https://riverpod.dev/)|[reduced_riverpod](https://github.com/partmaster/reduced_riverpod)|
|[Solidart](https://pub.dev/packages/solidart)|[reduced_solidart](https://github.com/partmaster/reduced_solidart)|
|[StatesRebuilder](https://pub.dev/packages/states_rebuilder)|[reduced_statesrebuilder](https://github.com/partmaster/reduced_statesrebuilder)|
