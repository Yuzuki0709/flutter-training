import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherCondition { rainy, cloudy, sunny }

extension WeatherConditionEx on WeatherCondition {
  static WeatherCondition fromString(String value) {
    switch (value) {
      case 'rainy':
        return WeatherCondition.rainy;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'sunny':
        return WeatherCondition.sunny;
      case (_):
        throw Exception('Invalid enum value: $value');
    }
  }

  SvgPicture get icon {
    switch (this) {
      case WeatherCondition.rainy:
        return Assets.rainy.svg();
      case WeatherCondition.cloudy:
        return Assets.cloudy.svg();
      case WeatherCondition.sunny:
        return Assets.sunny.svg();
    }
  }
}
