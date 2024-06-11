import 'package:flutter/material.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:flutter_training/screen/weather_screen/components/condition_icon.dart';
import 'package:flutter_training/utils/yumemi_weather_error_ex.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  YumemiWeatherApiResponse? _weather;
  final _yumemiWeatherRepository = YumemiWeatherRepository(YumemiWeather());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),

              // Weather icon
              AspectRatio(
                aspectRatio: 1,
                child: _weather == null
                    ? const Placeholder()
                    : ConditionIcon(condition: _weather!.weatherCondition),
              ),

              // Texts
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge!,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            _weather != null
                                ? '${_weather!.minTemperature} ℃'
                                : '** ℃',
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            _weather != null
                                ? '${_weather!.maxTemperature} ℃'
                                : '** ℃',
                            style: const TextStyle(
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
                                    final request = YumemiWeatherApiRequest(
                                      area: 'Tokyo',
                                      date: DateTime.now(),
                                    );
                                    setState(() {
                                      _weather = _yumemiWeatherRepository
                                          .fetchWeather(request: request);
                                    });
                                  } on YumemiWeatherError catch (e) {
                                    Future(() async {
                                      await _showErrorDialog(
                                        message: e.errorDescription(),
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
