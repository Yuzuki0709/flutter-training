import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({super.key, required this.condition});
  final String condition;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _iconPath(),
      semanticsLabel: _iconPath(),
    );
  }

  String _iconPath() {
    switch (condition) {
      case 'rainy': return 'assets/rainy.svg';
      case 'cloudy': return 'assets/cloudy.svg';
      case 'sunny': return 'assets/sunny.svg';
      default: return '';
    }
  }
}