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
  Widget build(BuildContext context) {
    Future(() async {
      await WidgetsBinding.instance.endOfFrame.then((_) {
        Future.delayed(const Duration(milliseconds: 500), () async {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => WeatherScreen(
                yumemiWeather: YumemiWeather(),
              ),
            ),
          );
          setState(() {});
        });
      });
    });
    return const ColoredBox(color: Colors.green);
  }
}
