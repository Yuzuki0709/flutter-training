import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather_condition.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({required WeatherCondition condition, super.key})
      : _condition = condition;

  final WeatherCondition _condition;

  @override
  Widget build(BuildContext context) {
    return _condition.icon;
  }
}
