// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yumemi_weather_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YumemiWeatherApiResponse _$YumemiWeatherApiResponseFromJson(
    Map<String, dynamic> json) {
  return _YumemiWeatherApiResponse.fromJson(json);
}

/// @nodoc
mixin _$YumemiWeatherApiResponse {
// 必要フィールドを定義
  WeatherCondition get weatherCondition => throw _privateConstructorUsedError;
  int get maxTemperature => throw _privateConstructorUsedError;
  int get minTemperature => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YumemiWeatherApiResponseCopyWith<YumemiWeatherApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YumemiWeatherApiResponseCopyWith<$Res> {
  factory $YumemiWeatherApiResponseCopyWith(YumemiWeatherApiResponse value,
          $Res Function(YumemiWeatherApiResponse) then) =
      _$YumemiWeatherApiResponseCopyWithImpl<$Res, YumemiWeatherApiResponse>;
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      int maxTemperature,
      int minTemperature,
      DateTime date});
}

/// @nodoc
class _$YumemiWeatherApiResponseCopyWithImpl<$Res,
        $Val extends YumemiWeatherApiResponse>
    implements $YumemiWeatherApiResponseCopyWith<$Res> {
  _$YumemiWeatherApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YumemiWeatherApiResponseImplCopyWith<$Res>
    implements $YumemiWeatherApiResponseCopyWith<$Res> {
  factory _$$YumemiWeatherApiResponseImplCopyWith(
          _$YumemiWeatherApiResponseImpl value,
          $Res Function(_$YumemiWeatherApiResponseImpl) then) =
      __$$YumemiWeatherApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      int maxTemperature,
      int minTemperature,
      DateTime date});
}

/// @nodoc
class __$$YumemiWeatherApiResponseImplCopyWithImpl<$Res>
    extends _$YumemiWeatherApiResponseCopyWithImpl<$Res,
        _$YumemiWeatherApiResponseImpl>
    implements _$$YumemiWeatherApiResponseImplCopyWith<$Res> {
  __$$YumemiWeatherApiResponseImplCopyWithImpl(
      _$YumemiWeatherApiResponseImpl _value,
      $Res Function(_$YumemiWeatherApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? date = null,
  }) {
    return _then(_$YumemiWeatherApiResponseImpl(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YumemiWeatherApiResponseImpl implements _YumemiWeatherApiResponse {
  const _$YumemiWeatherApiResponseImpl(
      {required this.weatherCondition,
      required this.maxTemperature,
      required this.minTemperature,
      required this.date});

  factory _$YumemiWeatherApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$YumemiWeatherApiResponseImplFromJson(json);

// 必要フィールドを定義
  @override
  final WeatherCondition weatherCondition;
  @override
  final int maxTemperature;
  @override
  final int minTemperature;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'YumemiWeatherApiResponse(weatherCondition: $weatherCondition, maxTemperature: $maxTemperature, minTemperature: $minTemperature, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YumemiWeatherApiResponseImpl &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weatherCondition, maxTemperature, minTemperature, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YumemiWeatherApiResponseImplCopyWith<_$YumemiWeatherApiResponseImpl>
      get copyWith => __$$YumemiWeatherApiResponseImplCopyWithImpl<
          _$YumemiWeatherApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YumemiWeatherApiResponseImplToJson(
      this,
    );
  }
}

abstract class _YumemiWeatherApiResponse implements YumemiWeatherApiResponse {
  const factory _YumemiWeatherApiResponse(
      {required final WeatherCondition weatherCondition,
      required final int maxTemperature,
      required final int minTemperature,
      required final DateTime date}) = _$YumemiWeatherApiResponseImpl;

  factory _YumemiWeatherApiResponse.fromJson(Map<String, dynamic> json) =
      _$YumemiWeatherApiResponseImpl.fromJson;

  @override // 必要フィールドを定義
  WeatherCondition get weatherCondition;
  @override
  int get maxTemperature;
  @override
  int get minTemperature;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$YumemiWeatherApiResponseImplCopyWith<_$YumemiWeatherApiResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
