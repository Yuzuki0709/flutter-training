// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yumemi_weather_api_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YumemiWeatherApiRequest {
// 必要フィールドを定義
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YumemiWeatherApiRequestCopyWith<YumemiWeatherApiRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YumemiWeatherApiRequestCopyWith<$Res> {
  factory $YumemiWeatherApiRequestCopyWith(YumemiWeatherApiRequest value,
          $Res Function(YumemiWeatherApiRequest) then) =
      _$YumemiWeatherApiRequestCopyWithImpl<$Res, YumemiWeatherApiRequest>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$YumemiWeatherApiRequestCopyWithImpl<$Res,
        $Val extends YumemiWeatherApiRequest>
    implements $YumemiWeatherApiRequestCopyWith<$Res> {
  _$YumemiWeatherApiRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YumemiWeatherApiRequestImplCopyWith<$Res>
    implements $YumemiWeatherApiRequestCopyWith<$Res> {
  factory _$$YumemiWeatherApiRequestImplCopyWith(
          _$YumemiWeatherApiRequestImpl value,
          $Res Function(_$YumemiWeatherApiRequestImpl) then) =
      __$$YumemiWeatherApiRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$YumemiWeatherApiRequestImplCopyWithImpl<$Res>
    extends _$YumemiWeatherApiRequestCopyWithImpl<$Res,
        _$YumemiWeatherApiRequestImpl>
    implements _$$YumemiWeatherApiRequestImplCopyWith<$Res> {
  __$$YumemiWeatherApiRequestImplCopyWithImpl(
      _$YumemiWeatherApiRequestImpl _value,
      $Res Function(_$YumemiWeatherApiRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$YumemiWeatherApiRequestImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$YumemiWeatherApiRequestImpl implements _YumemiWeatherApiRequest {
  const _$YumemiWeatherApiRequestImpl({required this.area, required this.date});

// 必要フィールドを定義
  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'YumemiWeatherApiRequest(area: $area, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YumemiWeatherApiRequestImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YumemiWeatherApiRequestImplCopyWith<_$YumemiWeatherApiRequestImpl>
      get copyWith => __$$YumemiWeatherApiRequestImplCopyWithImpl<
          _$YumemiWeatherApiRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YumemiWeatherApiRequestImplToJson(
      this,
    );
  }
}

abstract class _YumemiWeatherApiRequest implements YumemiWeatherApiRequest {
  const factory _YumemiWeatherApiRequest(
      {required final String area,
      required final DateTime date}) = _$YumemiWeatherApiRequestImpl;

  @override // 必要フィールドを定義
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$YumemiWeatherApiRequestImplCopyWith<_$YumemiWeatherApiRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
