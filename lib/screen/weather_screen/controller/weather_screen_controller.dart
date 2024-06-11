import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_screen_controller.g.dart';

@riverpod
class WeatherScreenController extends _$WeatherScreenController {
  @override
  YumemiWeatherApiResponse? build() {
    return null;
  }

  void fetchWeather({required YumemiWeatherApiRequest request}) {
    final yumemiWeatherRepository = ref.read(
      yumemiWeatherRepositoryProvider(client: YumemiWeather()).notifier,
    );

    try {
      state = yumemiWeatherRepository.fetchWeather(request: request);
    } on YumemiWeatherError {
      rethrow;
    }
  }
}
