import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = StateProvider((_) => 0);

class StateProviderSample extends ConsumerWidget {
  const StateProviderSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(myProvider);
    ref.listen(myProvider, (previous, next) {
      debugPrint('$previous to $next');
    });

    return Scaffold(
      appBar: AppBar(title: const Text('StateProviderSample')),
      body: Center(
        child: Text('Counter: $count', textScaleFactor: 4),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(myProvider.notifier).update((state) => state + 1),
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
