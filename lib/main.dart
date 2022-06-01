import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/state_notifier_provider_sample.dart';
import 'package:riverpod_sample/state_provider_sample.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleList(),
    );
  }
}

class SampleList extends StatelessWidget {
  const SampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var samples = {
      'StateProviderSample': () => const StateProviderSample(),
      'StateNotifierProviderSample': () => const StateNotifierProviderSample(),
    };
    return Scaffold(
        appBar: AppBar(title: const Text('List')),
        body: ListView(
          children: samples.keys
              .map((e) => OutlinedButton(
                  onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return samples[e]!();
                      })),
                  child: Text(e)))
              .toList(),
        ));
  }
}
