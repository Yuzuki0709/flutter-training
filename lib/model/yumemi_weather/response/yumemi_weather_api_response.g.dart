// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yumemi_weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YumemiWeatherApiResponseImpl _$$YumemiWeatherApiResponseImplFromJson(
  Map<String, dynamic> json,
) =>
    _$YumemiWeatherApiResponseImpl(
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weather_condition']),
      maxTemperature: (json['maxTemperature'] as num).toInt(),
      minTemperature: (json['minTemperature'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$YumemiWeatherApiResponseImplToJson(
  _$YumemiWeatherApiResponseImpl instance,
) =>
    <String, dynamic>{
      'weatherCondition': _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'maxTemperature': instance.maxTemperature,
      'minTemperature': instance.minTemperature,
      'date': instance.date.toIso8601String(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.sunny: 'sunny',
};
