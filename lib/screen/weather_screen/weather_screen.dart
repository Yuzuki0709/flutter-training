import 'package:flutter/material.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:flutter_training/screen/weather_screen/components/weather_detail.dart';
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

              WeatherDetail(weather: _weather),

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
