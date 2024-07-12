import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'yumemi_weather_repository.g.dart';

@riverpod
YumemiWeather yumemiWeather(YumemiWeatherRef ref) {
  return YumemiWeather();
}

@riverpod
YumemiWeatherRepository yumemiWeatherRepository(
  YumemiWeatherRepositoryRef ref,
) {
  return YumemiWeatherRepository(client: ref.watch(yumemiWeatherProvider));
}

class YumemiWeatherRepository {
  YumemiWeatherRepository({required YumemiWeather client}) : _client = client;
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

  Future<YumemiWeatherApiResponse> syncFetchWeather(
    YumemiWeatherApiRequest request,
  ) async {
    try {
      final result =
          await compute(_client.syncFetchWeather, jsonEncode(request.toJson()));
      return YumemiWeatherApiResponse.fromJson(
        jsonDecode(result) as Map<String, dynamic>,
      );
    } on YumemiWeatherError {
      rethrow;
    }
  }
}
