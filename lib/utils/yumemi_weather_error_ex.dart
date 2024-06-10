import 'package:yumemi_weather/yumemi_weather.dart';

extension YumemiWeatherErrorEx on YumemiWeatherError {
  String errorDescription() {
    switch (this) {
      case YumemiWeatherError.invalidParameter:
        return '入力値が無効です';
      case YumemiWeatherError.unknown:
        return '不明なエラーです';
    }
  }
}
