import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

ProviderContainer createContainer(List<Override> overrides) {
  final container = ProviderContainer(overrides: overrides);

  addTearDown(container.dispose);
  return container;
}
