import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleProvider = Provider((_) => 999);
final randomProvider = Provider((_) => Random().nextInt(100));
final dsiposeProvider = Provider.autoDispose((_) => Random().nextInt(100));

class ProviderSample extends ConsumerWidget {
  const ProviderSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleValue = ref.watch(sampleProvider);
    final randomValue = ref.watch(randomProvider);
    final disposeValue = ref.watch(dsiposeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProviderSample')),
      body: Center(
          child: Text(
              'sampleValue: $sampleValue\nrandomValue: $randomValue\ndisposeValue: $disposeValue',
              textScaleFactor: 2)),
    );
  }
}
