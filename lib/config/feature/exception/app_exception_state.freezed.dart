// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  dynamic get show => throw _privateConstructorUsedError;
  dynamic get code => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;
  dynamic get detailMessage => throw _privateConstructorUsedError;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call(
      {dynamic show, dynamic code, dynamic message, dynamic detailMessage});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? detailMessage = freezed,
  }) {
    return _then(_value.copyWith(
      show: freezed == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      detailMessage: freezed == detailMessage
          ? _value.detailMessage
          : detailMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppErrorImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$AppErrorImplCopyWith(
          _$AppErrorImpl value, $Res Function(_$AppErrorImpl) then) =
      __$$AppErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic show, dynamic code, dynamic message, dynamic detailMessage});
}

/// @nodoc
class __$$AppErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppErrorImpl>
    implements _$$AppErrorImplCopyWith<$Res> {
  __$$AppErrorImplCopyWithImpl(
      _$AppErrorImpl _value, $Res Function(_$AppErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? detailMessage = freezed,
  }) {
    return _then(_$AppErrorImpl(
      show: freezed == show ? _value.show! : show,
      code: freezed == code ? _value.code! : code,
      message: freezed == message ? _value.message! : message,
      detailMessage:
          freezed == detailMessage ? _value.detailMessage! : detailMessage,
    ));
  }
}

/// @nodoc

class _$AppErrorImpl implements _AppError {
  const _$AppErrorImpl(
      {this.show = false,
      this.code = '',
      this.message = '',
      this.detailMessage = ''});

  @override
  @JsonKey()
  final dynamic show;
  @override
  @JsonKey()
  final dynamic code;
  @override
  @JsonKey()
  final dynamic message;
  @override
  @JsonKey()
  final dynamic detailMessage;

  @override
  String toString() {
    return 'AppException(show: $show, code: $code, message: $message, detailMessage: $detailMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppErrorImpl &&
            const DeepCollectionEquality().equals(other.show, show) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.detailMessage, detailMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(show),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(detailMessage));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      __$$AppErrorImplCopyWithImpl<_$AppErrorImpl>(this, _$identity);
}

abstract class _AppError implements AppException {
  const factory _AppError(
      {final dynamic show,
      final dynamic code,
      final dynamic message,
      final dynamic detailMessage}) = _$AppErrorImpl;

  @override
  dynamic get show;
  @override
  dynamic get code;
  @override
  dynamic get message;
  @override
  dynamic get detailMessage;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppErrorImplCopyWith<_$AppErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
