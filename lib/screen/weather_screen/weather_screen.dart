import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/screen/weather_screen/components/weather_detail.dart';
import 'package:flutter_training/screen/weather_screen/controller/weather_screen_controller.dart';
import 'package:flutter_training/utils/yumemi_weather_error_ex.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @visibleForTesting
  static final reloadButtonKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherScreenControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                children: [
                  const Spacer(),

                  WeatherDetail(weather: state.response),

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
                                  key: const Key('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: TextButton(
                                  key: reloadButtonKey,
                                  onPressed: () async {
                                    final request = YumemiWeatherApiRequest(
                                      area: 'Tokyo',
                                      date: DateTime.now(),
                                    );

                                    try {
                                      await ref
                                          .read(
                                            weatherScreenControllerProvider
                                                .notifier,
                                          )
                                          .syncFetchWeather(request: request);
                                    } on YumemiWeatherError catch (e) {
                                      if (context.mounted) {
                                        await showDialog<void>(
                                          context: context,
                                          builder: (context) => _ErrorDialog(
                                            message: e.errorDescription(),
                                          ),
                                        );
                                      }
                                    }
                                  },
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
          if (state.isLoading) ...{
            const _LoadingIndicator(),
          },
        ],
      ),
    );
  }
}

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({required String message}) : _message = message;

  final String _message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラーが発生しました'),
      content: Text(_message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black54,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
