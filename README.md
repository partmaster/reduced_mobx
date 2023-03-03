![GitHub release (latest by date)](https://img.shields.io/github/v/release/partmaster/reduced_mobx)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/partmaster/reduced_mobx/dart.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/partmaster/reduced_mobx)
![GitHub last commit](https://img.shields.io/github/last-commit/partmaster/reduced_mobx)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/partmaster/reduced_mobx)
# reduced_mobx

Implementation of the 'reduced' API for the 'mobx' state management framework with following features:

1. Implementation of the ```Reducible``` interface 
2. Extension on the ```BuildContext``` for convenient access to the  ```Reducible``` instance.
3. Register a state for management.
4. Trigger a rebuild on widgets selectively after a state change.

## Features

#### 1. Implementation of the ```Reducible``` interface 

```dart
class ReducibleStore1<S, P1> = ReducibleStoreBase1<S, P1>
    with _$ReducibleStore1;
```

```dart
abstract class ReducibleStoreBase1<S, P1> extends Reducible<S> with Store {
  ReducibleStoreBase1(
    this.value,
    this.transformer1,
  );

  final ReducedTransformer<S, P1> transformer1;

  @observable
  S value;

  @override
  S get state => value;

  @override
  @action
  reduce(reducer) => value = reducer(value);

  @computed
  P1 get props1 => transformer1(this);
}
```

#### 2. Extension on the ```BuildContext``` for convenient access to the  ```Reducible``` instance.

```dart
extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducibleStore1] instance.
  ReducibleStore1<S, P1> store1<S, P1>() =>
      InheritedValueWidget.of<ReducibleStore1<S, P1>>(this);
}
```

#### 3. Register a state for management.

```dart
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
```

#### 4. Trigger a rebuild on widgets selectively after a state change.

```dart
extension WrapWithConsumer1<S, P1> on ReducibleStore1<S, P1> {
  Widget wrapWithConsumer<P>({
    required ReducedTransformer<S, P> transformer,
    required ReducedWidgetBuilder<P> builder,
  }) =>
      Observer(builder: (_) => builder(props: transformer(this)));
}
```

## Getting started

In the pubspec.yaml add dependencies on the package 'reduced' and on the package  'reduced_mobx'.

```
dependencies:
  reduced: ^0.1.0
  reduced_mobx: ^0.1.0
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

class Incrementer extends Reducer<int> {
  @override
  int call(int state) => state + 1;
}

class Props {
  Props({required this.counterText, required this.onPressed});
  final String counterText;
  final Callable<void> onPressed;
  @override
  toString() => counterText;
}

class PropsTransformer {
  static Props transform(Reducible<int> reducible) => Props(
        counterText: '${reducible.state}',
        onPressed: CallableAdapter(reducible, Incrementer()),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.props});

  final Props props;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('reduced_fluttercommand example'),
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
  Widget build(BuildContext context) => wrapWithProvider1(
        transformer1: PropsTransformer.transform,
        initialState: 0,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Builder(
            builder: (context) =>
                context.store1<int, Props>().wrapWithConsumer<Props>(
                      transformer: PropsTransformer.transform,
                      builder: MyHomePage.new,
                    ),
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
|[GetIt](https://pub.dev/packages/get_it)|[reduced_getit](https://github.com/partmaster/reduced_getit)|
|[GetX](https://pub.dev/packages/get)|[reduced_getx](https://github.com/partmaster/reduced_getx)|
|[MobX](https://pub.dev/packages/mobx)|[reduced_mobx](https://github.com/partmaster/reduced_mobx)|
|[Provider](https://pub.dev/packages/provider)|[reduced_provider](https://github.com/partmaster/reduced_provider)|
|[Redux](https://pub.dev/packages/redux)|[reduced_redux](https://github.com/partmaster/reduced_redux)|
|[Riverpod](https://riverpod.dev/)|[reduced_riverpod](https://github.com/partmaster/reduced_riverpod)|
|[Solidart](https://pub.dev/packages/solidart)|[reduced_solidart](https://github.com/partmaster/reduced_solidart)|
|[StatesRebuilder](https://pub.dev/packages/states_rebuilder)|[reduced_statesrebuilder](https://github.com/partmaster/reduced_statesrebuilder)|
