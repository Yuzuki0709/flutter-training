import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required YumemiWeatherApiResponse? weather, super.key})
      : _weather = weather;

  final YumemiWeatherApiResponse? _weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weather icon
        AspectRatio(
          aspectRatio: 1,
          child: _weather == null
              ? const Placeholder()
              : _weather.weatherCondition.icon,
        ),

        // Texts
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.labelLarge!,
            child: Row(
              children: [
                _TemperatureText(
                  temperature: _weather?.minTemperature,
                  color: Colors.blue,
                ),
                _TemperatureText(
                  temperature: _weather?.maxTemperature,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
    required int? temperature,
    required Color color,
  })  : _temperature = temperature,
        _color = color;

  final int? _temperature;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          '${_temperature ?? '**'} ℃',
          style: TextStyle(
            color: _color,
          ),
        ),
      ),
    );
  }
}
