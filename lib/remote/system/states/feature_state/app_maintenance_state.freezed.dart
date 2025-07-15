// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_maintenance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppMaintenanceState _$AppMaintenanceStateFromJson(Map<String, dynamic> json) {
  return _AppMaintenanceState.fromJson(json);
}

/// @nodoc
mixin _$AppMaintenanceState {
  bool get isMaintenance => throw _privateConstructorUsedError;

  /// Serializes this AppMaintenanceState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppMaintenanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppMaintenanceStateCopyWith<AppMaintenanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMaintenanceStateCopyWith<$Res> {
  factory $AppMaintenanceStateCopyWith(
          AppMaintenanceState value, $Res Function(AppMaintenanceState) then) =
      _$AppMaintenanceStateCopyWithImpl<$Res, AppMaintenanceState>;
  @useResult
  $Res call({bool isMaintenance});
}

/// @nodoc
class _$AppMaintenanceStateCopyWithImpl<$Res, $Val extends AppMaintenanceState>
    implements $AppMaintenanceStateCopyWith<$Res> {
  _$AppMaintenanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppMaintenanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMaintenance = null,
  }) {
    return _then(_value.copyWith(
      isMaintenance: null == isMaintenance
          ? _value.isMaintenance
          : isMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppMaintenanceStateImplCopyWith<$Res>
    implements $AppMaintenanceStateCopyWith<$Res> {
  factory _$$AppMaintenanceStateImplCopyWith(_$AppMaintenanceStateImpl value,
          $Res Function(_$AppMaintenanceStateImpl) then) =
      __$$AppMaintenanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isMaintenance});
}

/// @nodoc
class __$$AppMaintenanceStateImplCopyWithImpl<$Res>
    extends _$AppMaintenanceStateCopyWithImpl<$Res, _$AppMaintenanceStateImpl>
    implements _$$AppMaintenanceStateImplCopyWith<$Res> {
  __$$AppMaintenanceStateImplCopyWithImpl(_$AppMaintenanceStateImpl _value,
      $Res Function(_$AppMaintenanceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMaintenanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMaintenance = null,
  }) {
    return _then(_$AppMaintenanceStateImpl(
      isMaintenance: null == isMaintenance
          ? _value.isMaintenance
          : isMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppMaintenanceStateImpl implements _AppMaintenanceState {
  const _$AppMaintenanceStateImpl({this.isMaintenance = false});

  factory _$AppMaintenanceStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppMaintenanceStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isMaintenance;

  @override
  String toString() {
    return 'AppMaintenanceState(isMaintenance: $isMaintenance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppMaintenanceStateImpl &&
            (identical(other.isMaintenance, isMaintenance) ||
                other.isMaintenance == isMaintenance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isMaintenance);

  /// Create a copy of AppMaintenanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppMaintenanceStateImplCopyWith<_$AppMaintenanceStateImpl> get copyWith =>
      __$$AppMaintenanceStateImplCopyWithImpl<_$AppMaintenanceStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppMaintenanceStateImplToJson(
      this,
    );
  }
}

abstract class _AppMaintenanceState implements AppMaintenanceState {
  const factory _AppMaintenanceState({final bool isMaintenance}) =
      _$AppMaintenanceStateImpl;

  factory _AppMaintenanceState.fromJson(Map<String, dynamic> json) =
      _$AppMaintenanceStateImpl.fromJson;

  @override
  bool get isMaintenance;

  /// Create a copy of AppMaintenanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppMaintenanceStateImplCopyWith<_$AppMaintenanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
