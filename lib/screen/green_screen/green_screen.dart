import 'package:flutter/material.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class GreenScreen extends StatefulWidget {
  const GreenScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GreenScreenState();
}

class _GreenScreenState extends State<GreenScreen> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await WidgetsBinding.instance.endOfFrame.then((_) => _toWeatherScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }

  Future<void> _toWeatherScreen() async {
    await Future<void>.delayed(const Duration(milliseconds: 500))
        .then((_) async {
      if (!context.mounted) {
        return;
      }

      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => WeatherScreen(yumemiWeather: YumemiWeather()),
        ),
      );
      await _toWeatherScreen();
    });
  }
}
