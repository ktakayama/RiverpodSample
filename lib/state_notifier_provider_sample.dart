import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataListNotifierProvider =
    StateNotifierProvider<DataListNotifier, List<String>>(
        (_) => DataListNotifier());

class DataListNotifier extends StateNotifier<List<String>> {
  DataListNotifier() : super([]);

  void add(String text) {
    state = [...state, text];
  }

  void remove(String text) {
    state = [
      for (final t in state)
        if (t != text) t,
    ];
  }
}

class StateNotifierProviderSample extends ConsumerWidget {
  const StateNotifierProviderSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataListNotifierProvider);
    final notifier = ref.watch(dataListNotifierProvider.notifier);

    return Scaffold(
        appBar: AppBar(title: const Text('StateNotifierProviderSample')),
        body: ListView(children: [
          Text('data.length: ${data.length}', textScaleFactor: 2),
          if (data.isNotEmpty)
            Text('Latest: ${data.last}', textScaleFactor: 1.5),
        ]),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          children: [
            FloatingActionButton(
              onPressed: () => notifier.add(DateTime.now().toIso8601String()),
              child: const Icon(Icons.plus_one),
            ),
            FloatingActionButton(
              onPressed: () => notifier.remove(data[0]),
              child: const Icon(Icons.exposure_minus_1_rounded),
            ),
          ]
              .map((e) => Padding(padding: const EdgeInsets.all(4), child: e))
              .toList(),
        ));
  }
}
