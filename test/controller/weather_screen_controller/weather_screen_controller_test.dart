import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:flutter_training/screen/weather_screen/controller/state/weather_screen_controller_state.dart';
import 'package:flutter_training/screen/weather_screen/controller/weather_screen_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import '../../utils/create_container.dart';
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

  group('When fetchWeather is called', () {
    group('and in case request is valid', () {
      test('will return YumemiWeatherApiResponse', () {
        when(
          mockRepository.fetchWeather(request: request),
        ).thenAnswer((_) => response);

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        container
            .read(weatherScreenControllerProvider.notifier)
            .fetchWeather(request: request);

        expect(
          container.read(weatherScreenControllerProvider),
          isA<YumemiWeatherApiResponse>()
              .having((weather) => weather, 'weather data', response),
        );
      });
      test('will return unkown error', () {
        when(
          mockRepository.fetchWeather(request: request),
        ).thenThrow(YumemiWeatherError.unknown);

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        expect(
          () => container
              .read(weatherScreenControllerProvider.notifier)
              .fetchWeather(request: request),
          throwsA(
            isA<YumemiWeatherError>().having(
              (error) => error,
              'error',
              YumemiWeatherError.unknown,
            ),
          ),
        );
      });
    });

    group('and in case requets is invalid', () {
      test('will return invalid parameter error', () {
        when(
          mockRepository.fetchWeather(request: request),
        ).thenThrow(
          YumemiWeatherError.invalidParameter,
        );

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        expect(
          () => container
              .read(weatherScreenControllerProvider.notifier)
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
  });

  group('When syncFetchWeather is called', () {
    group('and in case request is valid', () {
      test('will return YumemiWeatherApiResponse', () async {
        when(
          mockRepository.syncFetchWeather(request),
        ).thenAnswer((_) => Future.value(response));

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        container.listen(weatherScreenControllerProvider, (_, __) {});

        await container
            .read(weatherScreenControllerProvider.notifier)
            .syncFetchWeather(
              request: request,
            );

        expect(
          container.read(weatherScreenControllerProvider),
          isA<WeatherScreenControllerState>()
              .having((state) => state.response, 'weather data', response),
        );
      });
      test('will return unkown error', () async {
        when(
          mockRepository.syncFetchWeather(request),
        ).thenThrow(YumemiWeatherError.unknown);

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        expect(
          () => container
              .read(weatherScreenControllerProvider.notifier)
              .syncFetchWeather(request: request),
          throwsA(
            isA<YumemiWeatherError>().having(
              (error) => error,
              'error',
              YumemiWeatherError.unknown,
            ),
          ),
        );
      });
    });

    group('and in case requets is invalid', () {
      test('will return invalid parameter error', () async {
        when(
          mockRepository.syncFetchWeather(request),
        ).thenThrow(
          YumemiWeatherError.invalidParameter,
        );

        final container = createContainer([
          yumemiWeatherRepositoryProvider.overrideWithValue(mockRepository),
        ]);

        expect(
          () => container
              .read(weatherScreenControllerProvider.notifier)
              .syncFetchWeather(request: request),
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
  });
}
