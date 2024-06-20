import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_screen_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeatherRepository>()])
void main() {
  final mockRepository = MockYumemiWeatherRepository();
  final request = YumemiWeatherApiRequest(
    area: 'Tokyo',
    date: DateTime.now(),
  );
  final response = YumemiWeatherApiResponse(
    weatherCondition: WeatherCondition.sunny,
    maxTemperature: 30,
    minTemperature: 15,
    date: DateTime(2024, 6, 19),
  );

  setUp(() {
    reset(mockRepository);
  });

  ProviderContainer createContainer() => ProviderContainer(
        overrides: [
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

  group('fetchWeather', () {
    test('success', () {
      when(
        mockRepository.fetchWeather(request: request),
      ).thenAnswer((_) => response);

      final container = createContainer();
      final result = container
          .read(yumemiWeatherRepositoryProvider)
          .fetchWeather(request: request);

      expect(
        result,
        isA<YumemiWeatherApiResponse>()
            .having((weather) => weather, 'weather data', response),
      );
    });

    test('invalid parameter error', () {
      when(
        mockRepository.fetchWeather(request: request),
      ).thenThrow(
        YumemiWeatherError.invalidParameter,
      );

      final container = createContainer();

      expect(
        () => container
            .read(yumemiWeatherRepositoryProvider)
            .fetchWeather(request: request),
        throwsA(
          isA<YumemiWeatherError>().having(
            (error) => error,
            'invalid parameter',
            YumemiWeatherError.invalidParameter,
          ),
        ),
      );
    });
  });
}
