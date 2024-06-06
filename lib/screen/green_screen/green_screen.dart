import 'package:flutter/material.dart';

class GreenScreen extends StatefulWidget {
  const GreenScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GreenScreenState();
}

class _GreenScreenState extends State<GreenScreen> {
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }
}
