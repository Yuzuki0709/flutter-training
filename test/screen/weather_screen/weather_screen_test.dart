import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:flutter_training/utils/yumemi_weather_error_ex.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import '../../data/yumemi_weather_repository/yumemi_weather_repository_test.mocks.dart';
import '../../utils/pump_screen.dart';
import '../../utils/set_surface_size.dart';

void main() {
  final yumemiWeather = MockYumemiWeather();
  const sunnyJsonData = '''
        {
          "weather_condition": "sunny",
          "max_temperature": 30, 
          "min_temperature": 15,
          "date": "2024-06-19T00:00:00.000"
        }
        ''';

  const cloudyJsonData = '''
        {
          "weather_condition": "cloudy",
          "max_temperature": 20, 
          "min_temperature": 10,
          "date": "2024-06-19T00:00:00.000"
        }
        ''';

  const rainyJsonData = '''
        {
          "weather_condition": "rainy",
          "max_temperature": 10, 
          "min_temperature": 5,
          "date": "2024-06-19T00:00:00.000"
        }
        ''';

  setUp(() {
    reset(yumemiWeather);
  });

  Future<void> pumpWeatherScreen(WidgetTester tester) async {
    await pumpScreen(
      tester,
      [
        yumemiWeatherProvider.overrideWithValue(yumemiWeather),
      ],
      const WeatherScreen(),
    );
  }

  group('When fetchWeather is called', () {
    group('and in case valid respone', () {
      testWidgets('will display sunny weather icon.', (tester) async {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenAnswer(
          (_) => sunnyJsonData,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.text('30 ℃'), findsOneWidget);
        expect(find.text('15 ℃'), findsOneWidget);
        expect(
          find.bySemanticsLabel(WeatherConditionEx.sunnyLabel),
          findsOneWidget,
        );
      });

      testWidgets('will display clody weather icon.', (tester) async {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenAnswer(
          (_) => cloudyJsonData,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.text('20 ℃'), findsOneWidget);
        expect(find.text('10 ℃'), findsOneWidget);
        expect(
          find.bySemanticsLabel(WeatherConditionEx.cloudyLabel),
          findsOneWidget,
        );
      });

      testWidgets('will display rainy weather icon.', (tester) async {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenAnswer(
          (_) => rainyJsonData,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.text('10 ℃'), findsOneWidget);
        expect(find.text('5 ℃'), findsOneWidget);
        expect(
          find.bySemanticsLabel(WeatherConditionEx.rainyLabel),
          findsOneWidget,
        );
      });
    });

    group('and in case error response', () {
      testWidgets('will display error dialog.', (tester) async {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenThrow(
          YumemiWeatherError.unknown,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pumpAndSettle();

        expect(
          find.widgetWithText(
            AlertDialog,
            YumemiWeatherError.unknown.errorDescription(),
          ),
          findsOneWidget,
        );

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        expect(
          find.widgetWithText(
            AlertDialog,
            YumemiWeatherError.unknown.errorDescription(),
          ),
          findsNothing,
        );
      });
    });
  });
}
