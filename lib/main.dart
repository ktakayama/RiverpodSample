import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/change_notifier_provider.dart';
import 'package:riverpod_sample/consumer_sample.dart';
import 'package:riverpod_sample/future_provider_sample.dart';
import 'package:riverpod_sample/provider_sample.dart';
import 'package:riverpod_sample/state_notifier_provider_sample.dart';
import 'package:riverpod_sample/state_provider_sample.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const SampleList({super.key});

  @override
  Widget build(BuildContext context) {
    var samples = {
      'ProviderSample': () => const ProviderSample(),
      'StateProviderSample': () => const StateProviderSample(),
      'StateNotifierProviderSample': () => const StateNotifierProviderSample(),
      'ChangeNotifierProviderSample': () =>
          const ChangeNotifierProviderSample(),
      'FutureProviderSample': () => const FutureProviderSample(),
      'ConsumerSample': () => const ConsumerSample(),
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
