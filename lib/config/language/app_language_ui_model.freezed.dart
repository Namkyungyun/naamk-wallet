// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_language_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppLanguageUiModel _$AppLanguageUiModelFromJson(Map<String, dynamic> json) {
  return _AppLanguageUiModel.fromJson(json);
}

/// @nodoc
mixin _$AppLanguageUiModel {
  AppLanguage get languageMode => throw _privateConstructorUsedError;

  /// Serializes this AppLanguageUiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppLanguageUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLanguageUiModelCopyWith<AppLanguageUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLanguageUiModelCopyWith<$Res> {
  factory $AppLanguageUiModelCopyWith(
          AppLanguageUiModel value, $Res Function(AppLanguageUiModel) then) =
      _$AppLanguageUiModelCopyWithImpl<$Res, AppLanguageUiModel>;
  @useResult
  $Res call({AppLanguage languageMode});
}

/// @nodoc
class _$AppLanguageUiModelCopyWithImpl<$Res, $Val extends AppLanguageUiModel>
    implements $AppLanguageUiModelCopyWith<$Res> {
  _$AppLanguageUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLanguageUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageMode = null,
  }) {
    return _then(_value.copyWith(
      languageMode: null == languageMode
          ? _value.languageMode
          : languageMode // ignore: cast_nullable_to_non_nullable
              as AppLanguage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLanguageUiModelImplCopyWith<$Res>
    implements $AppLanguageUiModelCopyWith<$Res> {
  factory _$$AppLanguageUiModelImplCopyWith(_$AppLanguageUiModelImpl value,
          $Res Function(_$AppLanguageUiModelImpl) then) =
      __$$AppLanguageUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppLanguage languageMode});
}

/// @nodoc
class __$$AppLanguageUiModelImplCopyWithImpl<$Res>
    extends _$AppLanguageUiModelCopyWithImpl<$Res, _$AppLanguageUiModelImpl>
    implements _$$AppLanguageUiModelImplCopyWith<$Res> {
  __$$AppLanguageUiModelImplCopyWithImpl(_$AppLanguageUiModelImpl _value,
      $Res Function(_$AppLanguageUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLanguageUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageMode = null,
  }) {
    return _then(_$AppLanguageUiModelImpl(
      languageMode: null == languageMode
          ? _value.languageMode
          : languageMode // ignore: cast_nullable_to_non_nullable
              as AppLanguage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLanguageUiModelImpl implements _AppLanguageUiModel {
  const _$AppLanguageUiModelImpl({this.languageMode = AppLanguage.ko});

  factory _$AppLanguageUiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLanguageUiModelImplFromJson(json);

  @override
  @JsonKey()
  final AppLanguage languageMode;

  @override
  String toString() {
    return 'AppLanguageUiModel(languageMode: $languageMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLanguageUiModelImpl &&
            (identical(other.languageMode, languageMode) ||
                other.languageMode == languageMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageMode);

  /// Create a copy of AppLanguageUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLanguageUiModelImplCopyWith<_$AppLanguageUiModelImpl> get copyWith =>
      __$$AppLanguageUiModelImplCopyWithImpl<_$AppLanguageUiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLanguageUiModelImplToJson(
      this,
    );
  }
}

abstract class _AppLanguageUiModel implements AppLanguageUiModel {
  const factory _AppLanguageUiModel({final AppLanguage languageMode}) =
      _$AppLanguageUiModelImpl;

  factory _AppLanguageUiModel.fromJson(Map<String, dynamic> json) =
      _$AppLanguageUiModelImpl.fromJson;

  @override
  AppLanguage get languageMode;

  /// Create a copy of AppLanguageUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLanguageUiModelImplCopyWith<_$AppLanguageUiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
