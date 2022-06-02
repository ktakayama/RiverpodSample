import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/http_client_provider.dart';

final configProvider = FutureProvider((ref) async {
  final result = await ref.watch(httpClientProvider).get(
        Uri.parse(
            'https://run.mocky.io/v3/b73d3456-a36f-4155-87ee-47bc7e98568f'),
      );
  final json = (await jsonDecode(result.body) as Map<String, Object?>);
  return json;
});

class FutureProviderSample extends ConsumerWidget {
  const FutureProviderSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('StateProviderSample')),
        body: config.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
            data: (config) {
              return Text(config['appName'].toString());
            }));
  }
}
