// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationReqDto _$PaginationReqDtoFromJson(Map<String, dynamic> json) {
  return _PaginationReqDto.fromJson(json);
}

/// @nodoc
mixin _$PaginationReqDto {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  /// Serializes this PaginationReqDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationReqDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationReqDtoCopyWith<PaginationReqDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationReqDtoCopyWith<$Res> {
  factory $PaginationReqDtoCopyWith(
          PaginationReqDto value, $Res Function(PaginationReqDto) then) =
      _$PaginationReqDtoCopyWithImpl<$Res, PaginationReqDto>;
  @useResult
  $Res call({int page, int size});
}

/// @nodoc
class _$PaginationReqDtoCopyWithImpl<$Res, $Val extends PaginationReqDto>
    implements $PaginationReqDtoCopyWith<$Res> {
  _$PaginationReqDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationReqDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationReqDtoImplCopyWith<$Res>
    implements $PaginationReqDtoCopyWith<$Res> {
  factory _$$PaginationReqDtoImplCopyWith(_$PaginationReqDtoImpl value,
          $Res Function(_$PaginationReqDtoImpl) then) =
      __$$PaginationReqDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size});
}

/// @nodoc
class __$$PaginationReqDtoImplCopyWithImpl<$Res>
    extends _$PaginationReqDtoCopyWithImpl<$Res, _$PaginationReqDtoImpl>
    implements _$$PaginationReqDtoImplCopyWith<$Res> {
  __$$PaginationReqDtoImplCopyWithImpl(_$PaginationReqDtoImpl _value,
      $Res Function(_$PaginationReqDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationReqDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$PaginationReqDtoImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationReqDtoImpl implements _PaginationReqDto {
  const _$PaginationReqDtoImpl({this.page = 0, this.size = 10});

  factory _$PaginationReqDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationReqDtoImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'PaginationReqDto(page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationReqDtoImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size);

  /// Create a copy of PaginationReqDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationReqDtoImplCopyWith<_$PaginationReqDtoImpl> get copyWith =>
      __$$PaginationReqDtoImplCopyWithImpl<_$PaginationReqDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationReqDtoImplToJson(
      this,
    );
  }
}

abstract class _PaginationReqDto implements PaginationReqDto {
  const factory _PaginationReqDto({final int page, final int size}) =
      _$PaginationReqDtoImpl;

  factory _PaginationReqDto.fromJson(Map<String, dynamic> json) =
      _$PaginationReqDtoImpl.fromJson;

  @override
  int get page;
  @override
  int get size;

  /// Create a copy of PaginationReqDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationReqDtoImplCopyWith<_$PaginationReqDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
