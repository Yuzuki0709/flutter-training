import 'dart:convert';

import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherRepository {
  YumemiWeatherRepository(this._client);
  final YumemiWeather _client;

  YumemiWeatherApiResponse fetchWeather({
    required YumemiWeatherApiRequest request,
  }) {
    try {
      final result = _client.fetchWeather(jsonEncode(request.toJson()));
      return YumemiWeatherApiResponse.fromJson(
        jsonDecode(result) as Map<String, dynamic>,
      );
    } on YumemiWeatherError {
      rethrow;
    }
  }
}
