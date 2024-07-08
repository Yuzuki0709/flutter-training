import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum WeatherCondition { rainy, cloudy, sunny }

extension WeatherConditionEx on WeatherCondition {
  @visibleForTesting
  static const rainyLabel = 'RainyIcon';
  @visibleForTesting
  static const cloudyLabel = 'CloudyIcon';
  @visibleForTesting
  static const sunnyLabel = 'SunnyIcon';

  SvgPicture get icon {
    switch (this) {
      case WeatherCondition.rainy:
        return Assets.rainy.svg(semanticsLabel: rainyLabel);
      case WeatherCondition.cloudy:
        return Assets.cloudy.svg(semanticsLabel: cloudyLabel);
      case WeatherCondition.sunny:
        return Assets.sunny.svg(semanticsLabel: sunnyLabel);
    }
  }
}
