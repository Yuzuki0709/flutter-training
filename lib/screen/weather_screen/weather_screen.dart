import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_training/screen/weather_screen/components/condition_icon.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({required this.yumemiWeather, super.key});
  final YumemiWeather yumemiWeather;

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<YumemiWeather>('yumemiWeather', yumemiWeather));
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? _condition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),

              // Placeholder
              AspectRatio(
                aspectRatio: 1,
                child: _condition == null 
                    ? const Placeholder() 
                    : ConditionIcon(condition: _condition!),
              ),

              // Texts
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge!,
                  child: const Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Buttons
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                          _condition = widget.yumemiWeather.fetchSimpleWeather();
                        });
                              },
                              child: const Text('Reload'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ,,,,],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}