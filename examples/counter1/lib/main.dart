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
