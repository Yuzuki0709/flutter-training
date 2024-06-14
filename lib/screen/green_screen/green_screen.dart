import 'package:flutter/material.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:flutter_training/utils/after_display_mixin.dart';

class GreenScreen extends StatefulWidget {
  const GreenScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GreenScreenState();
}

class _GreenScreenState extends State<GreenScreen> with AfterDisplayMixin {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await WidgetsBinding.instance.endOfFrame.then((_) {
        afterDisplay();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }

  Future<void> _toWeatherScreen() async {
    await Future<void>.delayed(const Duration(milliseconds: 500), () async {
      if (!context.mounted) {
        return;
      }

      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const WeatherScreen(),
        ),
      );
      await _toWeatherScreen();
    });
  }

  @override
  void afterDisplay() {
    Future(() async => _toWeatherScreen());
  }
}
