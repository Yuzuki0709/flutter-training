import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:flutter_training/utils/yumemi_weather_error_ex.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import '../../controller/weather_screen_controller/weather_screen_controller_test.mocks.dart';
import '../../utils/pump_screen.dart';
import '../../utils/set_surface_size.dart';

void main() {
  final mockRepository = MockYumemiWeatherRepository();

  final sunnyWeather = YumemiWeatherApiResponse(
    weatherCondition: WeatherCondition.sunny,
    maxTemperature: 30,
    minTemperature: 15,
    date: DateTime(2024, 6, 19),
  );

  final cloudyWeather = YumemiWeatherApiResponse(
    weatherCondition: WeatherCondition.cloudy,
    maxTemperature: 20,
    minTemperature: 10,
    date: DateTime(2024, 6, 19),
  );

  final rainyWeather = YumemiWeatherApiResponse(
    weatherCondition: WeatherCondition.rainy,
    maxTemperature: 10,
    minTemperature: 5,
    date: DateTime(2024, 6, 19),
  );

  setUp(() {
    reset(yumemiWeather);
  });

  Future<void> pumpWeatherScreen(WidgetTester tester) async {
    await pumpScreen(
      tester,
      [
        yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
      ],
      const WeatherScreen(),
    );
  }

  group('When fetchWeather is called', () {
    group('and in case valid respone', () {
      testWidgets('will display sunny weather icon.', (tester) async {
        final completer = Completer<YumemiWeatherApiResponse>();
        when(
          mockRepository.syncFetchWeather(any),
        ).thenAnswer(
          (_) => completer.future,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        completer.complete(sunnyWeather);

        await tester.pump();

        expect(find.text('30 ℃'), findsOneWidget);
        expect(find.text('15 ℃'), findsOneWidget);
        expect(
          find.bySemanticsLabel(WeatherConditionEx.sunnyLabel),
          findsOneWidget,
        );
      });

      testWidgets('will display clody weather icon.', (tester) async {
        final completer = Completer<YumemiWeatherApiResponse>();
        when(
          mockRepository.syncFetchWeather(any),
        ).thenAnswer(
          (_) => completer.future,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        completer.complete(cloudyWeather);

        await tester.pump();

        expect(find.text('20 ℃'), findsOneWidget);
        expect(find.text('10 ℃'), findsOneWidget);
        expect(
          find.bySemanticsLabel(WeatherConditionEx.cloudyLabel),
          findsOneWidget,
        );
      });

      testWidgets('will display rainy weather icon.', (tester) async {
        final completer = Completer<YumemiWeatherApiResponse>();
        when(
          mockRepository.syncFetchWeather(any),
        ).thenAnswer(
          (_) => completer.future,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.text('** ℃'), findsNWidgets(2));

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        completer.complete(rainyWeather);

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
        final completer = Completer<YumemiWeatherApiResponse>();
        when(
          mockRepository.syncFetchWeather(any),
        ).thenAnswer(
          (_) => completer.future,
        );

        await setSurfaceSize();
        await pumpWeatherScreen(tester);

        await tester.tap(find.byKey(WeatherScreen.reloadButtonKey));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        completer.completeError(YumemiWeatherError.unknown);

        await tester.pump();

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
