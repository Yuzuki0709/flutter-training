import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),

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
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Buttons
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Reload'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
