import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              // Placeholder
              const AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),

              // Texts
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge!,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '** ℃',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '** ℃',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Close')),
                    TextButton(onPressed: () {}, child: const Text('Reload')),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
