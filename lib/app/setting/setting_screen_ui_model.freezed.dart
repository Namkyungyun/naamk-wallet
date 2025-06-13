// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_screen_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingScreenUiModel _$SettingScreenUiModelFromJson(Map<String, dynamic> json) {
  return _SettingPageUiModel.fromJson(json);
}

/// @nodoc
mixin _$SettingScreenUiModel {
  bool get showLanguageCard => throw _privateConstructorUsedError;

  /// Serializes this SettingScreenUiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingScreenUiModelCopyWith<SettingScreenUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingScreenUiModelCopyWith<$Res> {
  factory $SettingScreenUiModelCopyWith(SettingScreenUiModel value,
          $Res Function(SettingScreenUiModel) then) =
      _$SettingScreenUiModelCopyWithImpl<$Res, SettingScreenUiModel>;
  @useResult
  $Res call({bool showLanguageCard});
}

/// @nodoc
class _$SettingScreenUiModelCopyWithImpl<$Res,
        $Val extends SettingScreenUiModel>
    implements $SettingScreenUiModelCopyWith<$Res> {
  _$SettingScreenUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLanguageCard = null,
  }) {
    return _then(_value.copyWith(
      showLanguageCard: null == showLanguageCard
          ? _value.showLanguageCard
          : showLanguageCard // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingPageUiModelImplCopyWith<$Res>
    implements $SettingScreenUiModelCopyWith<$Res> {
  factory _$$SettingPageUiModelImplCopyWith(_$SettingPageUiModelImpl value,
          $Res Function(_$SettingPageUiModelImpl) then) =
      __$$SettingPageUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showLanguageCard});
}

/// @nodoc
class __$$SettingPageUiModelImplCopyWithImpl<$Res>
    extends _$SettingScreenUiModelCopyWithImpl<$Res, _$SettingPageUiModelImpl>
    implements _$$SettingPageUiModelImplCopyWith<$Res> {
  __$$SettingPageUiModelImplCopyWithImpl(_$SettingPageUiModelImpl _value,
      $Res Function(_$SettingPageUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLanguageCard = null,
  }) {
    return _then(_$SettingPageUiModelImpl(
      showLanguageCard: null == showLanguageCard
          ? _value.showLanguageCard
          : showLanguageCard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingPageUiModelImpl implements _SettingPageUiModel {
  const _$SettingPageUiModelImpl({this.showLanguageCard = false});

  factory _$SettingPageUiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingPageUiModelImplFromJson(json);

  @override
  @JsonKey()
  final bool showLanguageCard;

  @override
  String toString() {
    return 'SettingScreenUiModel(showLanguageCard: $showLanguageCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingPageUiModelImpl &&
            (identical(other.showLanguageCard, showLanguageCard) ||
                other.showLanguageCard == showLanguageCard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, showLanguageCard);

  /// Create a copy of SettingScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingPageUiModelImplCopyWith<_$SettingPageUiModelImpl> get copyWith =>
      __$$SettingPageUiModelImplCopyWithImpl<_$SettingPageUiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingPageUiModelImplToJson(
      this,
    );
  }
}

abstract class _SettingPageUiModel implements SettingScreenUiModel {
  const factory _SettingPageUiModel({final bool showLanguageCard}) =
      _$SettingPageUiModelImpl;

  factory _SettingPageUiModel.fromJson(Map<String, dynamic> json) =
      _$SettingPageUiModelImpl.fromJson;

  @override
  bool get showLanguageCard;

  /// Create a copy of SettingScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingPageUiModelImplCopyWith<_$SettingPageUiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
