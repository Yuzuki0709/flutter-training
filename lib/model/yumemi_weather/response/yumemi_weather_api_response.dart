import 'package:flutter_training/model/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'yumemi_weather_api_response.freezed.dart';
part 'yumemi_weather_api_response.g.dart';

@freezed
class YumemiWeatherApiResponse with _$YumemiWeatherApiResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory YumemiWeatherApiResponse({
    // 必要フィールドを定義
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required DateTime date,
  }) = _YumemiWeatherApiResponse;

  factory YumemiWeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$YumemiWeatherApiResponseFromJson(json);
}
