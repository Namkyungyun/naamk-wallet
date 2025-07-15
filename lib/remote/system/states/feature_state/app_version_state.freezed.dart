// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppVersionState _$AppVersionStateFromJson(Map<String, dynamic> json) {
  return _AppVersionState.fromJson(json);
}

/// @nodoc
mixin _$AppVersionState {
  String get os => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  bool get isForce => throw _privateConstructorUsedError;

  /// Serializes this AppVersionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppVersionStateCopyWith<AppVersionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionStateCopyWith<$Res> {
  factory $AppVersionStateCopyWith(
          AppVersionState value, $Res Function(AppVersionState) then) =
      _$AppVersionStateCopyWithImpl<$Res, AppVersionState>;
  @useResult
  $Res call({String os, String version, bool isForce});
}

/// @nodoc
class _$AppVersionStateCopyWithImpl<$Res, $Val extends AppVersionState>
    implements $AppVersionStateCopyWith<$Res> {
  _$AppVersionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppVersionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? version = null,
    Object? isForce = null,
  }) {
    return _then(_value.copyWith(
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      isForce: null == isForce
          ? _value.isForce
          : isForce // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionStateImplCopyWith<$Res>
    implements $AppVersionStateCopyWith<$Res> {
  factory _$$AppVersionStateImplCopyWith(_$AppVersionStateImpl value,
          $Res Function(_$AppVersionStateImpl) then) =
      __$$AppVersionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String os, String version, bool isForce});
}

/// @nodoc
class __$$AppVersionStateImplCopyWithImpl<$Res>
    extends _$AppVersionStateCopyWithImpl<$Res, _$AppVersionStateImpl>
    implements _$$AppVersionStateImplCopyWith<$Res> {
  __$$AppVersionStateImplCopyWithImpl(
      _$AppVersionStateImpl _value, $Res Function(_$AppVersionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppVersionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? version = null,
    Object? isForce = null,
  }) {
    return _then(_$AppVersionStateImpl(
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      isForce: null == isForce
          ? _value.isForce
          : isForce // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVersionStateImpl implements _AppVersionState {
  const _$AppVersionStateImpl(
      {this.os = '', this.version = '', this.isForce = false});

  factory _$AppVersionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionStateImplFromJson(json);

  @override
  @JsonKey()
  final String os;
  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final bool isForce;

  @override
  String toString() {
    return 'AppVersionState(os: $os, version: $version, isForce: $isForce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionStateImpl &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isForce, isForce) || other.isForce == isForce));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, os, version, isForce);

  /// Create a copy of AppVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionStateImplCopyWith<_$AppVersionStateImpl> get copyWith =>
      __$$AppVersionStateImplCopyWithImpl<_$AppVersionStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionStateImplToJson(
      this,
    );
  }
}

abstract class _AppVersionState implements AppVersionState {
  const factory _AppVersionState(
      {final String os,
      final String version,
      final bool isForce}) = _$AppVersionStateImpl;

  factory _AppVersionState.fromJson(Map<String, dynamic> json) =
      _$AppVersionStateImpl.fromJson;

  @override
  String get os;
  @override
  String get version;
  @override
  bool get isForce;

  /// Create a copy of AppVersionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppVersionStateImplCopyWith<_$AppVersionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
