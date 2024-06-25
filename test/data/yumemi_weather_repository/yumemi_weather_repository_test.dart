import 'package:flutter_training/data/yumemi_weather_repository.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:flutter_training/model/yumemi_weather/response/yumemi_weather_api_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import '../../utils/create_container.dart';
import 'yumemi_weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  final yumemiWeather = MockYumemiWeather();
  final request = YumemiWeatherApiRequest(
    area: 'Tokyo',
    date: DateTime.now(),
  );
  const jsonData = '''
        {
          "weather_condition": "sunny",
          "max_temperature": 30, 
          "min_temperature": 15,
          "date": "2024-06-19T00:00:00.000"
        }
        ''';

  setUp(() {
    reset(yumemiWeather);
  });

  group('When fetchWeather is called', () {
    group('and in case request is valid', () {
      test('will return YumemiWeatherApiResponse', () {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenAnswer(
          (_) => jsonData,
        );

        final container = createContainer([
          yumemiWeatherProvider.overrideWithValue(yumemiWeather),
        ]);
        final result = container
            .read(yumemiWeatherRepositoryProvider)
            .fetchWeather(request: request);

        expect(
          result,
          isA<YumemiWeatherApiResponse>().having(
            (weather) => weather,
            'Weather data',
            YumemiWeatherApiResponse(
              weatherCondition: WeatherCondition.sunny,
              maxTemperature: 30,
              minTemperature: 15,
              date: DateTime(2024, 6, 19),
            ),
          ),
        );
      });

      test('will return unkown error', () {
        when(
          yumemiWeather.fetchWeather(any),
        ).thenThrow(YumemiWeatherError.unknown);

        final container = createContainer([
          yumemiWeatherProvider.overrideWithValue(yumemiWeather),
        ]);

        expect(
          () => container
              .read(yumemiWeatherRepositoryProvider)
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
          yumemiWeather.fetchWeather(any),
        ).thenThrow(YumemiWeatherError.invalidParameter);

        final container = createContainer([
          yumemiWeatherProvider.overrideWithValue(yumemiWeather),
        ]);

        expect(
          () => container
              .read(yumemiWeatherRepositoryProvider)
              .fetchWeather(request: request),
          throwsA(
            isA<YumemiWeatherError>().having(
              (error) => error,
              'error',
              YumemiWeatherError.invalidParameter,
            ),
          ),
        );
      });
    });
  });
}
