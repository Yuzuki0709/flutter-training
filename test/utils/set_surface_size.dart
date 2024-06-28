import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';

Future<void> setSurfaceSize() async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  await binding.setSurfaceSize(const Size(1080, 1920));
}
