// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppThemeUiModel _$AppThemeUiModelFromJson(Map<String, dynamic> json) {
  return _AppThemeUiModel.fromJson(json);
}

/// @nodoc
mixin _$AppThemeUiModel {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  /// Serializes this AppThemeUiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppThemeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppThemeUiModelCopyWith<AppThemeUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeUiModelCopyWith<$Res> {
  factory $AppThemeUiModelCopyWith(
          AppThemeUiModel value, $Res Function(AppThemeUiModel) then) =
      _$AppThemeUiModelCopyWithImpl<$Res, AppThemeUiModel>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$AppThemeUiModelCopyWithImpl<$Res, $Val extends AppThemeUiModel>
    implements $AppThemeUiModelCopyWith<$Res> {
  _$AppThemeUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppThemeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppThemeUiModelImplCopyWith<$Res>
    implements $AppThemeUiModelCopyWith<$Res> {
  factory _$$AppThemeUiModelImplCopyWith(_$AppThemeUiModelImpl value,
          $Res Function(_$AppThemeUiModelImpl) then) =
      __$$AppThemeUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$AppThemeUiModelImplCopyWithImpl<$Res>
    extends _$AppThemeUiModelCopyWithImpl<$Res, _$AppThemeUiModelImpl>
    implements _$$AppThemeUiModelImplCopyWith<$Res> {
  __$$AppThemeUiModelImplCopyWithImpl(
      _$AppThemeUiModelImpl _value, $Res Function(_$AppThemeUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppThemeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$AppThemeUiModelImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppThemeUiModelImpl implements _AppThemeUiModel {
  const _$AppThemeUiModelImpl({this.themeMode = ThemeMode.system});

  factory _$AppThemeUiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppThemeUiModelImplFromJson(json);

  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'AppThemeUiModel(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppThemeUiModelImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of AppThemeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppThemeUiModelImplCopyWith<_$AppThemeUiModelImpl> get copyWith =>
      __$$AppThemeUiModelImplCopyWithImpl<_$AppThemeUiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppThemeUiModelImplToJson(
      this,
    );
  }
}

abstract class _AppThemeUiModel implements AppThemeUiModel {
  const factory _AppThemeUiModel({final ThemeMode themeMode}) =
      _$AppThemeUiModelImpl;

  factory _AppThemeUiModel.fromJson(Map<String, dynamic> json) =
      _$AppThemeUiModelImpl.fromJson;

  @override
  ThemeMode get themeMode;

  /// Create a copy of AppThemeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppThemeUiModelImplCopyWith<_$AppThemeUiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
