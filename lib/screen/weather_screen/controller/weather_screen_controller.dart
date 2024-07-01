import 'package:flutter/foundation.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/screen/weather_screen/controller/state/weather_screen_controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_screen_controller.g.dart';

@riverpod
class WeatherScreenController extends _$WeatherScreenController {
  @override
  WeatherScreenControllerState build() {
    return const WeatherScreenControllerState(
      response: null,
      isLoading: false,
    );
  }

  void fetchWeather({required YumemiWeatherApiRequest request}) {
    final yumemiWeatherRepository = ref.read(yumemiWeatherRepositoryProvider);

    try {
      final response = yumemiWeatherRepository.fetchWeather(request: request);
      state = state.copyWith(response: response);
    } on YumemiWeatherError {
      rethrow;
    }
  }

  Future<void> syncFetchWeather({
    required YumemiWeatherApiRequest request,
  }) async {
    final yumemiWeatherRepository = ref.read(yumemiWeatherRepositoryProvider);

    try {
      state = state.copyWith(isLoading: true);
      final response =
          await compute(yumemiWeatherRepository.syncFetchWeather, request);
      state = state.copyWith(response: response, isLoading: false);
    } on YumemiWeatherError {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
