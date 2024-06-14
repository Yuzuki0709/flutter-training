import 'package:freezed_annotation/freezed_annotation.dart';

part 'yumemi_weather_api_request.freezed.dart';
part 'yumemi_weather_api_request.g.dart';

@Freezed(toJson: true)
class YumemiWeatherApiRequest with _$YumemiWeatherApiRequest {
  const factory YumemiWeatherApiRequest({
    // 必要フィールドを定義
    required String area,
    required DateTime date,
  }) = _YumemiWeatherApiRequest;
}
