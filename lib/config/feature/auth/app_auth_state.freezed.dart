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
mixin _$AppAuthState {
  dynamic get useLock => throw _privateConstructorUsedError;
  dynamic get method => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;

  /// Create a copy of AppAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppAuthStateCopyWith<AppAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAuthStateCopyWith<$Res> {
  factory $AppAuthStateCopyWith(
          AppAuthState value, $Res Function(AppAuthState) then) =
      _$AppAuthStateCopyWithImpl<$Res, AppAuthState>;
  @useResult
  $Res call({dynamic useLock, dynamic method, dynamic status});
}

/// @nodoc
class _$AppAuthStateCopyWithImpl<$Res, $Val extends AppAuthState>
    implements $AppAuthStateCopyWith<$Res> {
  _$AppAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useLock = freezed,
    Object? method = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      useLock: freezed == useLock
          ? _value.useLock
          : useLock // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$AppAuthStateImplCopyWith<$Res>
    implements $AppAuthStateCopyWith<$Res> {
  factory _$$AppAuthStateImplCopyWith(
          _$AppAuthStateImpl value, $Res Function(_$AppAuthStateImpl) then) =
      __$$AppAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic useLock, dynamic method, dynamic status});
}

/// @nodoc
class __$$AppAuthStateImplCopyWithImpl<$Res>
    extends _$AppAuthStateCopyWithImpl<$Res, _$AppAuthStateImpl>
    implements _$$AppAuthStateImplCopyWith<$Res> {
  __$$AppAuthStateImplCopyWithImpl(
      _$AppAuthStateImpl _value, $Res Function(_$AppAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useLock = freezed,
    Object? method = freezed,
    Object? status = freezed,
  }) {
    return _then(_$AppAuthStateImpl(
      useLock: freezed == useLock ? _value.useLock! : useLock,
      method: freezed == method ? _value.method! : method,
      status: freezed == status ? _value.status! : status,
    ));
  }
}

/// @nodoc

class _$AppAuthStateImpl implements _AppAuthState {
  const _$AppAuthStateImpl(
      {this.useLock = false,
      this.method = AppAuthMethod.none,
      this.status = AppAuthStatus.idle});

  @override
  @JsonKey()
  final dynamic useLock;
  @override
  @JsonKey()
  final dynamic method;
  @override
  @JsonKey()
  final dynamic status;

  @override
  String toString() {
    return 'AppAuthState(useLock: $useLock, method: $method, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppAuthStateImpl &&
            const DeepCollectionEquality().equals(other.useLock, useLock) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(useLock),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(status));

  /// Create a copy of AppAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppAuthStateImplCopyWith<_$AppAuthStateImpl> get copyWith =>
      __$$AppAuthStateImplCopyWithImpl<_$AppAuthStateImpl>(this, _$identity);
}

abstract class _AppAuthState implements AppAuthState {
  const factory _AppAuthState(
      {final dynamic useLock,
      final dynamic method,
      final dynamic status}) = _$AppAuthStateImpl;

  @override
  dynamic get useLock;
  @override
  dynamic get method;
  @override
  dynamic get status;

  /// Create a copy of AppAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppAuthStateImplCopyWith<_$AppAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
