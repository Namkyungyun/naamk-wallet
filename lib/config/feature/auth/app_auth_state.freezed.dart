// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppAuth {
  dynamic get method => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;

  /// Create a copy of AppAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppAuthCopyWith<AppAuth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAuthCopyWith<$Res> {
  factory $AppAuthCopyWith(AppAuth value, $Res Function(AppAuth) then) =
      _$AppAuthCopyWithImpl<$Res, AppAuth>;
  @useResult
  $Res call({dynamic method, dynamic status});
}

/// @nodoc
class _$AppAuthCopyWithImpl<$Res, $Val extends AppAuth>
    implements $AppAuthCopyWith<$Res> {
  _$AppAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLockImplCopyWith<$Res> implements $AppAuthCopyWith<$Res> {
  factory _$$AppLockImplCopyWith(
          _$AppLockImpl value, $Res Function(_$AppLockImpl) then) =
      __$$AppLockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic method, dynamic status});
}

/// @nodoc
class __$$AppLockImplCopyWithImpl<$Res>
    extends _$AppAuthCopyWithImpl<$Res, _$AppLockImpl>
    implements _$$AppLockImplCopyWith<$Res> {
  __$$AppLockImplCopyWithImpl(
      _$AppLockImpl _value, $Res Function(_$AppLockImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = freezed,
    Object? status = freezed,
  }) {
    return _then(_$AppLockImpl(
      method: freezed == method ? _value.method! : method,
      status: freezed == status ? _value.status! : status,
    ));
  }
}

/// @nodoc

class _$AppLockImpl implements _AppLock {
  const _$AppLockImpl(
      {this.method = AppAuthMethod.none, this.status = AppAuthStatus.idle});

  @override
  @JsonKey()
  final dynamic method;
  @override
  @JsonKey()
  final dynamic status;

  @override
  String toString() {
    return 'AppAuth(method: $method, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLockImpl &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(status));

  /// Create a copy of AppAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLockImplCopyWith<_$AppLockImpl> get copyWith =>
      __$$AppLockImplCopyWithImpl<_$AppLockImpl>(this, _$identity);
}

abstract class _AppLock implements AppAuth {
  const factory _AppLock({final dynamic method, final dynamic status}) =
      _$AppLockImpl;

  @override
  dynamic get method;
  @override
  dynamic get status;

  /// Create a copy of AppAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLockImplCopyWith<_$AppLockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
