import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherCondition { rainy, cloudy, sunny }

extension WeatherConditionEx on WeatherCondition {
  SvgPicture get icon {
    switch (this) {
      case WeatherCondition.rainy:
        return Assets.rainy.svg(semanticsLabel: 'RainyIcon');
      case WeatherCondition.cloudy:
        return Assets.cloudy.svg(semanticsLabel: 'CloudyIcon');
      case WeatherCondition.sunny:
        return Assets.sunny.svg(semanticsLabel: 'SunnyIcon');
    }
  }
}
