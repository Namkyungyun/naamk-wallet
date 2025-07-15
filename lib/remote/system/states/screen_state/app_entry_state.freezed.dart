// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_entry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEntryState {
  dynamic get appEntryStatus => throw _privateConstructorUsedError;
  String get userLoginSessionReq => throw _privateConstructorUsedError;
  ViewState<LoginSessionState> get userLoginSessionRes =>
      throw _privateConstructorUsedError;
  ViewState<AppMaintenanceState> get appMaintenanceRes =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppEntryStateCopyWith<AppEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEntryStateCopyWith<$Res> {
  factory $AppEntryStateCopyWith(
          AppEntryState value, $Res Function(AppEntryState) then) =
      _$AppEntryStateCopyWithImpl<$Res, AppEntryState>;
  @useResult
  $Res call(
      {dynamic appEntryStatus,
      String userLoginSessionReq,
      ViewState<LoginSessionState> userLoginSessionRes,
      ViewState<AppMaintenanceState> appMaintenanceRes});

  $ViewStateCopyWith<LoginSessionState, $Res> get userLoginSessionRes;
  $ViewStateCopyWith<AppMaintenanceState, $Res> get appMaintenanceRes;
}

/// @nodoc
class _$AppEntryStateCopyWithImpl<$Res, $Val extends AppEntryState>
    implements $AppEntryStateCopyWith<$Res> {
  _$AppEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEntryStatus = freezed,
    Object? userLoginSessionReq = null,
    Object? userLoginSessionRes = null,
    Object? appMaintenanceRes = null,
  }) {
    return _then(_value.copyWith(
      appEntryStatus: freezed == appEntryStatus
          ? _value.appEntryStatus
          : appEntryStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userLoginSessionReq: null == userLoginSessionReq
          ? _value.userLoginSessionReq
          : userLoginSessionReq // ignore: cast_nullable_to_non_nullable
              as String,
      userLoginSessionRes: null == userLoginSessionRes
          ? _value.userLoginSessionRes
          : userLoginSessionRes // ignore: cast_nullable_to_non_nullable
              as ViewState<LoginSessionState>,
      appMaintenanceRes: null == appMaintenanceRes
          ? _value.appMaintenanceRes
          : appMaintenanceRes // ignore: cast_nullable_to_non_nullable
              as ViewState<AppMaintenanceState>,
    ) as $Val);
  }

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewStateCopyWith<LoginSessionState, $Res> get userLoginSessionRes {
    return $ViewStateCopyWith<LoginSessionState, $Res>(
        _value.userLoginSessionRes, (value) {
      return _then(_value.copyWith(userLoginSessionRes: value) as $Val);
    });
  }

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewStateCopyWith<AppMaintenanceState, $Res> get appMaintenanceRes {
    return $ViewStateCopyWith<AppMaintenanceState, $Res>(
        _value.appMaintenanceRes, (value) {
      return _then(_value.copyWith(appMaintenanceRes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppEntryStateImplCopyWith<$Res>
    implements $AppEntryStateCopyWith<$Res> {
  factory _$$AppEntryStateImplCopyWith(
          _$AppEntryStateImpl value, $Res Function(_$AppEntryStateImpl) then) =
      __$$AppEntryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic appEntryStatus,
      String userLoginSessionReq,
      ViewState<LoginSessionState> userLoginSessionRes,
      ViewState<AppMaintenanceState> appMaintenanceRes});

  @override
  $ViewStateCopyWith<LoginSessionState, $Res> get userLoginSessionRes;
  @override
  $ViewStateCopyWith<AppMaintenanceState, $Res> get appMaintenanceRes;
}

/// @nodoc
class __$$AppEntryStateImplCopyWithImpl<$Res>
    extends _$AppEntryStateCopyWithImpl<$Res, _$AppEntryStateImpl>
    implements _$$AppEntryStateImplCopyWith<$Res> {
  __$$AppEntryStateImplCopyWithImpl(
      _$AppEntryStateImpl _value, $Res Function(_$AppEntryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEntryStatus = freezed,
    Object? userLoginSessionReq = null,
    Object? userLoginSessionRes = null,
    Object? appMaintenanceRes = null,
  }) {
    return _then(_$AppEntryStateImpl(
      appEntryStatus:
          freezed == appEntryStatus ? _value.appEntryStatus! : appEntryStatus,
      userLoginSessionReq: null == userLoginSessionReq
          ? _value.userLoginSessionReq
          : userLoginSessionReq // ignore: cast_nullable_to_non_nullable
              as String,
      userLoginSessionRes: null == userLoginSessionRes
          ? _value.userLoginSessionRes
          : userLoginSessionRes // ignore: cast_nullable_to_non_nullable
              as ViewState<LoginSessionState>,
      appMaintenanceRes: null == appMaintenanceRes
          ? _value.appMaintenanceRes
          : appMaintenanceRes // ignore: cast_nullable_to_non_nullable
              as ViewState<AppMaintenanceState>,
    ));
  }
}

/// @nodoc

class _$AppEntryStateImpl implements _AppEntryState {
  const _$AppEntryStateImpl(
      {this.appEntryStatus = AppEntryCheckStatus.none,
      this.userLoginSessionReq = '',
      this.userLoginSessionRes = const ViewState<LoginSessionState>(),
      this.appMaintenanceRes = const ViewState<AppMaintenanceState>()});

  @override
  @JsonKey()
  final dynamic appEntryStatus;
  @override
  @JsonKey()
  final String userLoginSessionReq;
  @override
  @JsonKey()
  final ViewState<LoginSessionState> userLoginSessionRes;
  @override
  @JsonKey()
  final ViewState<AppMaintenanceState> appMaintenanceRes;

  @override
  String toString() {
    return 'AppEntryState(appEntryStatus: $appEntryStatus, userLoginSessionReq: $userLoginSessionReq, userLoginSessionRes: $userLoginSessionRes, appMaintenanceRes: $appMaintenanceRes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEntryStateImpl &&
            const DeepCollectionEquality()
                .equals(other.appEntryStatus, appEntryStatus) &&
            (identical(other.userLoginSessionReq, userLoginSessionReq) ||
                other.userLoginSessionReq == userLoginSessionReq) &&
            (identical(other.userLoginSessionRes, userLoginSessionRes) ||
                other.userLoginSessionRes == userLoginSessionRes) &&
            (identical(other.appMaintenanceRes, appMaintenanceRes) ||
                other.appMaintenanceRes == appMaintenanceRes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appEntryStatus),
      userLoginSessionReq,
      userLoginSessionRes,
      appMaintenanceRes);

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEntryStateImplCopyWith<_$AppEntryStateImpl> get copyWith =>
      __$$AppEntryStateImplCopyWithImpl<_$AppEntryStateImpl>(this, _$identity);
}

abstract class _AppEntryState implements AppEntryState {
  const factory _AppEntryState(
          {final dynamic appEntryStatus,
          final String userLoginSessionReq,
          final ViewState<LoginSessionState> userLoginSessionRes,
          final ViewState<AppMaintenanceState> appMaintenanceRes}) =
      _$AppEntryStateImpl;

  @override
  dynamic get appEntryStatus;
  @override
  String get userLoginSessionReq;
  @override
  ViewState<LoginSessionState> get userLoginSessionRes;
  @override
  ViewState<AppMaintenanceState> get appMaintenanceRes;

  /// Create a copy of AppEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppEntryStateImplCopyWith<_$AppEntryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
