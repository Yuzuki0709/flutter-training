// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yumemi_weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YumemiWeatherApiResponseImpl _$$YumemiWeatherApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$YumemiWeatherApiResponseImpl',
      json,
      ($checkedConvert) {
        final val = _$YumemiWeatherApiResponseImpl(
          weatherCondition: $checkedConvert('weather_condition',
              (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          maxTemperature:
              $checkedConvert('max_temperature', (v) => (v as num).toInt()),
          minTemperature:
              $checkedConvert('min_temperature', (v) => (v as num).toInt()),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherCondition': 'weather_condition',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature'
      },
    );

Map<String, dynamic> _$$YumemiWeatherApiResponseImplToJson(
        _$YumemiWeatherApiResponseImpl instance) =>
    <String, dynamic>{
      'weather_condition':
          _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'date': instance.date.toIso8601String(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.sunny: 'sunny',
};
