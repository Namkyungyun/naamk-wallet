// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_banner_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventBannerReqDto _$EventBannerReqDtoFromJson(Map<String, dynamic> json) {
  return _EventBannerReqDto.fromJson(json);
}

/// @nodoc
mixin _$EventBannerReqDto {
  PaginationReqDto get pagination => throw _privateConstructorUsedError;
  Map<String, dynamic> get options => throw _privateConstructorUsedError;

  /// Serializes this EventBannerReqDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventBannerReqDtoCopyWith<EventBannerReqDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventBannerReqDtoCopyWith<$Res> {
  factory $EventBannerReqDtoCopyWith(
          EventBannerReqDto value, $Res Function(EventBannerReqDto) then) =
      _$EventBannerReqDtoCopyWithImpl<$Res, EventBannerReqDto>;
  @useResult
  $Res call({PaginationReqDto pagination, Map<String, dynamic> options});

  $PaginationReqDtoCopyWith<$Res> get pagination;
}

/// @nodoc
class _$EventBannerReqDtoCopyWithImpl<$Res, $Val extends EventBannerReqDto>
    implements $EventBannerReqDtoCopyWith<$Res> {
  _$EventBannerReqDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationReqDto,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationReqDtoCopyWith<$Res> get pagination {
    return $PaginationReqDtoCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventBannerReqDtoImplCopyWith<$Res>
    implements $EventBannerReqDtoCopyWith<$Res> {
  factory _$$EventBannerReqDtoImplCopyWith(_$EventBannerReqDtoImpl value,
          $Res Function(_$EventBannerReqDtoImpl) then) =
      __$$EventBannerReqDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationReqDto pagination, Map<String, dynamic> options});

  @override
  $PaginationReqDtoCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$EventBannerReqDtoImplCopyWithImpl<$Res>
    extends _$EventBannerReqDtoCopyWithImpl<$Res, _$EventBannerReqDtoImpl>
    implements _$$EventBannerReqDtoImplCopyWith<$Res> {
  __$$EventBannerReqDtoImplCopyWithImpl(_$EventBannerReqDtoImpl _value,
      $Res Function(_$EventBannerReqDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? options = null,
  }) {
    return _then(_$EventBannerReqDtoImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationReqDto,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventBannerReqDtoImpl implements _EventBannerReqDto {
  const _$EventBannerReqDtoImpl(
      {this.pagination = const PaginationReqDto(),
      final Map<String, dynamic> options = const {}})
      : _options = options;

  factory _$EventBannerReqDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventBannerReqDtoImplFromJson(json);

  @override
  @JsonKey()
  final PaginationReqDto pagination;
  final Map<String, dynamic> _options;
  @override
  @JsonKey()
  Map<String, dynamic> get options {
    if (_options is EqualUnmodifiableMapView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_options);
  }

  @override
  String toString() {
    return 'EventBannerReqDto(pagination: $pagination, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventBannerReqDtoImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pagination, const DeepCollectionEquality().hash(_options));

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventBannerReqDtoImplCopyWith<_$EventBannerReqDtoImpl> get copyWith =>
      __$$EventBannerReqDtoImplCopyWithImpl<_$EventBannerReqDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventBannerReqDtoImplToJson(
      this,
    );
  }
}

abstract class _EventBannerReqDto implements EventBannerReqDto {
  const factory _EventBannerReqDto(
      {final PaginationReqDto pagination,
      final Map<String, dynamic> options}) = _$EventBannerReqDtoImpl;

  factory _EventBannerReqDto.fromJson(Map<String, dynamic> json) =
      _$EventBannerReqDtoImpl.fromJson;

  @override
  PaginationReqDto get pagination;
  @override
  Map<String, dynamic> get options;

  /// Create a copy of EventBannerReqDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventBannerReqDtoImplCopyWith<_$EventBannerReqDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
