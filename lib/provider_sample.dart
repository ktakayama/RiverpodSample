import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleProvider = Provider((_) => 999);
final dsiposeProvider = Provider.autoDispose((_) => Random().nextInt(100));
final randomProvider = Provider((_) => Random().nextInt(100));
final randomDoubleProvider = Provider((ref) => ref.watch(randomProvider) * 2);

class ProviderSample extends ConsumerWidget {
  const ProviderSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleValue = ref.watch(sampleProvider);
    final disposeValue = ref.watch(dsiposeProvider);
    final randomValue = ref.watch(randomProvider);
    final randomDoubleValue = ref.watch(randomDoubleProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('FutureProviderSample')),
        body: Center(
            child: Text(
                'sampleValue: $sampleValue\ndisposeValue: $disposeValue\nrandomValue: $randomValue\nrandomDouble: $randomDoubleValue',
                textScaleFactor: 1.8)),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => ref
            ..refresh(sampleProvider)
            ..refresh(randomProvider)
            ..refresh(dsiposeProvider),
        ));
  }
}
