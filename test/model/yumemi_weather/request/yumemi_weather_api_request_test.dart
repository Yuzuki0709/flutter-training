import 'package:flutter_training/model/yumemi_weather/request/yumemi_weather_api_request.dart';
import 'package:test/test.dart';

void main() {
  group('When toJson is called', () {
    group('and in case request is valid', () {
      test('will return valid json', () {
        final request = YumemiWeatherApiRequest(
          area: 'Tokyo',
          date: DateTime(2024, 6, 20),
        );

        final result = request.toJson();

        expect(
          result,
          {'area': 'Tokyo', 'date': '2024-06-20T00:00:00.000'},
        );
      });
    });
  });
}
