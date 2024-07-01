// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_screen_controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherScreenControllerState {
  YumemiWeatherApiResponse? get response => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherScreenControllerStateCopyWith<WeatherScreenControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherScreenControllerStateCopyWith<$Res> {
  factory $WeatherScreenControllerStateCopyWith(
          WeatherScreenControllerState value,
          $Res Function(WeatherScreenControllerState) then) =
      _$WeatherScreenControllerStateCopyWithImpl<$Res,
          WeatherScreenControllerState>;
  @useResult
  $Res call({YumemiWeatherApiResponse? response, bool isLoading});

  $YumemiWeatherApiResponseCopyWith<$Res>? get response;
}

/// @nodoc
class _$WeatherScreenControllerStateCopyWithImpl<$Res,
        $Val extends WeatherScreenControllerState>
    implements $WeatherScreenControllerStateCopyWith<$Res> {
  _$WeatherScreenControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as YumemiWeatherApiResponse?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YumemiWeatherApiResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $YumemiWeatherApiResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherScreenControllerStateImplCopyWith<$Res>
    implements $WeatherScreenControllerStateCopyWith<$Res> {
  factory _$$WeatherScreenControllerStateImplCopyWith(
          _$WeatherScreenControllerStateImpl value,
          $Res Function(_$WeatherScreenControllerStateImpl) then) =
      __$$WeatherScreenControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YumemiWeatherApiResponse? response, bool isLoading});

  @override
  $YumemiWeatherApiResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$WeatherScreenControllerStateImplCopyWithImpl<$Res>
    extends _$WeatherScreenControllerStateCopyWithImpl<$Res,
        _$WeatherScreenControllerStateImpl>
    implements _$$WeatherScreenControllerStateImplCopyWith<$Res> {
  __$$WeatherScreenControllerStateImplCopyWithImpl(
      _$WeatherScreenControllerStateImpl _value,
      $Res Function(_$WeatherScreenControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$WeatherScreenControllerStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as YumemiWeatherApiResponse?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WeatherScreenControllerStateImpl
    implements _WeatherScreenControllerState {
  const _$WeatherScreenControllerStateImpl(
      {required this.response, required this.isLoading});

  @override
  final YumemiWeatherApiResponse? response;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'WeatherScreenControllerState(response: $response, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherScreenControllerStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherScreenControllerStateImplCopyWith<
          _$WeatherScreenControllerStateImpl>
      get copyWith => __$$WeatherScreenControllerStateImplCopyWithImpl<
          _$WeatherScreenControllerStateImpl>(this, _$identity);
}

abstract class _WeatherScreenControllerState
    implements WeatherScreenControllerState {
  const factory _WeatherScreenControllerState(
      {required final YumemiWeatherApiResponse? response,
      required final bool isLoading}) = _$WeatherScreenControllerStateImpl;

  @override
  YumemiWeatherApiResponse? get response;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$WeatherScreenControllerStateImplCopyWith<
          _$WeatherScreenControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
