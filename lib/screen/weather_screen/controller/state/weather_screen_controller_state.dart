import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_screen_controller_state.freezed.dart';

@freezed
class WeatherScreenControllerState with _$WeatherScreenControllerState {
  const factory WeatherScreenControllerState({
    required YumemiWeatherApiResponse? response,
    required bool isLoading,
  }) = _WeatherScreenControllerState;
}
