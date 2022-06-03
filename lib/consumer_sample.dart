import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/state_provider_sample.dart';

class ConsumerSample extends StatelessWidget {
  const ConsumerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConsumerSample')),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final count = ref.watch(myProvider);
          return Text('Counter: $count', textScaleFactor: 4);
        }),
      ),
    );
  }
}
