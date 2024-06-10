import 'package:flutter/material.dart';
import 'package:flutter_training/screen/weather_screen/components/condition_icon.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({required YumemiWeather yumemiWeather, super.key})
      : _yumemiWeather = yumemiWeather;
  final YumemiWeather _yumemiWeather;

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
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
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    _condition = widget._yumemiWeather
                                        .fetchThrowsWeather('tokyo');
                                  } on YumemiWeatherError {
                                    Future(() async {
                                      await _showErrorDialog(
                                        message: '原因不明のエラーです',
                                      );
                                    });
                                  }
                                });
                              },
                              child: const Text('Reload'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showErrorDialog({required String message}) {
    return showDialog(
      context: context,
      builder: (context) => _ErrorDialog(message: message),
    );
  }
}

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({required String message}) : _message = message;

  final String _message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラーが発生しました'),
      content: Text(_message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
