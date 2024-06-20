import 'dart:convert';

import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('from json', () {
    test('sucess', () {
      const jsonData = '''
            {
              "weather_condition": "sunny",
              "max_temperature": 30,
              "min_temperature": 15,
              "date": "2024-06-20 00:00:00"
            }
            ''';

      final data = jsonDecode(jsonData) as Map<String, dynamic>;
      final result = YumemiWeatherApiResponse.fromJson(data);

      expect(
        result,
        YumemiWeatherApiResponse(
          weatherCondition: WeatherCondition.sunny,
          maxTemperature: 30,
          minTemperature: 15,
          date: DateTime(2024, 6, 20),
        ),
      );
    });

    test('invalid parameter', () {
      const jsonData = '''
            {
              "weather_condition": "aho",
              "max_temperature": 30,
              "min_temperature": 15,
              "date": "2024-06-20 00:00:00"
            }
            ''';

      final data = jsonDecode(jsonData) as Map<String, dynamic>;

      expect(
        () => YumemiWeatherApiResponse.fromJson(data),
        throwsA(
          isA<CheckedFromJsonException>(),
        ),
      );
    });

    test('invalid key', () {
      const jsonData = '''
            {
              "hoge": "sunny",
              "max_temperature": 30,
              "min_temperature": 15,
              "date": "2024-06-20 00:00:00"
            }
            ''';

      final data = jsonDecode(jsonData) as Map<String, dynamic>;

      expect(
        () => YumemiWeatherApiResponse.fromJson(data),
        throwsA(
          isA<CheckedFromJsonException>(),
        ),
      );
    });
  });
}
