// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_lock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLock {
  dynamic get lockMode => throw _privateConstructorUsedError;
  dynamic get lockStatus => throw _privateConstructorUsedError;

  /// Create a copy of AppLock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLockCopyWith<AppLock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLockCopyWith<$Res> {
  factory $AppLockCopyWith(AppLock value, $Res Function(AppLock) then) =
      _$AppLockCopyWithImpl<$Res, AppLock>;
  @useResult
  $Res call({dynamic lockMode, dynamic lockStatus});
}

/// @nodoc
class _$AppLockCopyWithImpl<$Res, $Val extends AppLock>
    implements $AppLockCopyWith<$Res> {
  _$AppLockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockMode = freezed,
    Object? lockStatus = freezed,
  }) {
    return _then(_value.copyWith(
      lockMode: freezed == lockMode
          ? _value.lockMode
          : lockMode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lockStatus: freezed == lockStatus
          ? _value.lockStatus
          : lockStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLockImplCopyWith<$Res> implements $AppLockCopyWith<$Res> {
  factory _$$AppLockImplCopyWith(
          _$AppLockImpl value, $Res Function(_$AppLockImpl) then) =
      __$$AppLockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic lockMode, dynamic lockStatus});
}

/// @nodoc
class __$$AppLockImplCopyWithImpl<$Res>
    extends _$AppLockCopyWithImpl<$Res, _$AppLockImpl>
    implements _$$AppLockImplCopyWith<$Res> {
  __$$AppLockImplCopyWithImpl(
      _$AppLockImpl _value, $Res Function(_$AppLockImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockMode = freezed,
    Object? lockStatus = freezed,
  }) {
    return _then(_$AppLockImpl(
      lockMode: freezed == lockMode ? _value.lockMode! : lockMode,
      lockStatus: freezed == lockStatus ? _value.lockStatus! : lockStatus,
    ));
  }
}

/// @nodoc

class _$AppLockImpl implements _AppLock {
  const _$AppLockImpl(
      {this.lockMode = AppLockMode.none,
      this.lockStatus = AppLockStatus.unlocked});

  @override
  @JsonKey()
  final dynamic lockMode;
  @override
  @JsonKey()
  final dynamic lockStatus;

  @override
  String toString() {
    return 'AppLock(lockMode: $lockMode, lockStatus: $lockStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLockImpl &&
            const DeepCollectionEquality().equals(other.lockMode, lockMode) &&
            const DeepCollectionEquality()
                .equals(other.lockStatus, lockStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lockMode),
      const DeepCollectionEquality().hash(lockStatus));

  /// Create a copy of AppLock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLockImplCopyWith<_$AppLockImpl> get copyWith =>
      __$$AppLockImplCopyWithImpl<_$AppLockImpl>(this, _$identity);
}

abstract class _AppLock implements AppLock {
  const factory _AppLock({final dynamic lockMode, final dynamic lockStatus}) =
      _$AppLockImpl;

  @override
  dynamic get lockMode;
  @override
  dynamic get lockStatus;

  /// Create a copy of AppLock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLockImplCopyWith<_$AppLockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
