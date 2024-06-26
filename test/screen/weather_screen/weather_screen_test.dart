import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/screen/weather_screen/weather_screen.dart';
import 'package:mockito/mockito.dart';

import '../../data/yumemi_weather_repository/yumemi_weather_repository_test.mocks.dart';

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
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(yumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );
  }

  testWidgets('Display sunny weather icon', (tester) async {
    when(
      yumemiWeather.fetchWeather(any),
    ).thenAnswer(
      (_) => sunnyJsonData,
    );

    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));

    await pumpWeatherScreen(tester);

    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.text('** ℃'), findsNWidgets(2));

    await tester.tap(find.byKey(const Key('Reload')));
    await tester.pump();

    expect(find.text('30 ℃'), findsOneWidget);
    expect(find.text('15 ℃'), findsOneWidget);
    expect(find.bySemanticsLabel('SunnyIcon'), findsOneWidget);
  });

  testWidgets('Display clody weather icon', (tester) async {
    when(
      yumemiWeather.fetchWeather(any),
    ).thenAnswer(
      (_) => cloudyJsonData,
    );

    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));

    await pumpWeatherScreen(tester);

    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.text('** ℃'), findsNWidgets(2));

    await tester.tap(find.byKey(const Key('Reload')));
    await tester.pump();

    expect(find.text('20 ℃'), findsOneWidget);
    expect(find.text('10 ℃'), findsOneWidget);
    expect(find.bySemanticsLabel('CloudyIcon'), findsOneWidget);
  });

  testWidgets('Display rainy weather icon', (tester) async {
    when(
      yumemiWeather.fetchWeather(any),
    ).thenAnswer(
      (_) => rainyJsonData,
    );

    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));

    await pumpWeatherScreen(tester);

    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.text('** ℃'), findsNWidgets(2));

    await tester.tap(find.byKey(const Key('Reload')));
    await tester.pump();

    expect(find.text('10 ℃'), findsOneWidget);
    expect(find.text('5 ℃'), findsOneWidget);
    expect(find.bySemanticsLabel('RainyIcon'), findsOneWidget);
  });
}
