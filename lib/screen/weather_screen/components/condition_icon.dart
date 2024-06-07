import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather_condition.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({required String condition, super.key})
      : _condition = condition;

  final String _condition;

  @override
  Widget build(BuildContext context) {
    try {
      final condition = WeatherConditionEx.fromString(_condition);
      return condition.icon;
    } on Exception {
      return const Icon(
        Icons.error,
        size: 200,
        color: Colors.red,
      );
    }
  }
}
