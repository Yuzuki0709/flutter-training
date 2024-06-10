import 'package:flutter/widgets.dart';

mixin AfterDisplayMixin<T extends StatefulWidget> on State<T> {
  void afterDisplay();
}
