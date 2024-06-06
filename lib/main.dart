import 'package:flutter/material.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(
        yumemiWeather: YumemiWeather(),
      ),
    );
  }
}
