import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({required String condition, super.key})
      : _condition = condition;

  final String _condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _icon(),
    );
  }

  SvgPicture? _icon() {
    switch (_condition) {
      case 'rainy':
        return Assets.rainy.svg();
      case 'cloudy':
        return Assets.cloudy.svg();
      case 'sunny':
        return Assets.sunny.svg();
      default:
        return null;
    }
  }
}
