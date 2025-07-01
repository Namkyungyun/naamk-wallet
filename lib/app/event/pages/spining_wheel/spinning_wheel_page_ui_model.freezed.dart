// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spinning_wheel_page_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpinningWheelUiModel _$SpinningWheelUiModelFromJson(Map<String, dynamic> json) {
  return _SpinningWheelUiModel.fromJson(json);
}

/// @nodoc
mixin _$SpinningWheelUiModel {
  double get angle => throw _privateConstructorUsedError;
  String? get selectedItem => throw _privateConstructorUsedError;

  /// Serializes this SpinningWheelUiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpinningWheelUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpinningWheelUiModelCopyWith<SpinningWheelUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpinningWheelUiModelCopyWith<$Res> {
  factory $SpinningWheelUiModelCopyWith(SpinningWheelUiModel value,
          $Res Function(SpinningWheelUiModel) then) =
      _$SpinningWheelUiModelCopyWithImpl<$Res, SpinningWheelUiModel>;
  @useResult
  $Res call({double angle, String? selectedItem});
}

/// @nodoc
class _$SpinningWheelUiModelCopyWithImpl<$Res,
        $Val extends SpinningWheelUiModel>
    implements $SpinningWheelUiModelCopyWith<$Res> {
  _$SpinningWheelUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpinningWheelUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = null,
    Object? selectedItem = freezed,
  }) {
    return _then(_value.copyWith(
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpinningWheelUiModelImplCopyWith<$Res>
    implements $SpinningWheelUiModelCopyWith<$Res> {
  factory _$$SpinningWheelUiModelImplCopyWith(_$SpinningWheelUiModelImpl value,
          $Res Function(_$SpinningWheelUiModelImpl) then) =
      __$$SpinningWheelUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double angle, String? selectedItem});
}

/// @nodoc
class __$$SpinningWheelUiModelImplCopyWithImpl<$Res>
    extends _$SpinningWheelUiModelCopyWithImpl<$Res, _$SpinningWheelUiModelImpl>
    implements _$$SpinningWheelUiModelImplCopyWith<$Res> {
  __$$SpinningWheelUiModelImplCopyWithImpl(_$SpinningWheelUiModelImpl _value,
      $Res Function(_$SpinningWheelUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpinningWheelUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = null,
    Object? selectedItem = freezed,
  }) {
    return _then(_$SpinningWheelUiModelImpl(
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpinningWheelUiModelImpl implements _SpinningWheelUiModel {
  const _$SpinningWheelUiModelImpl({required this.angle, this.selectedItem});

  factory _$SpinningWheelUiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpinningWheelUiModelImplFromJson(json);

  @override
  final double angle;
  @override
  final String? selectedItem;

  @override
  String toString() {
    return 'SpinningWheelUiModel(angle: $angle, selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpinningWheelUiModelImpl &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, angle, selectedItem);

  /// Create a copy of SpinningWheelUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinningWheelUiModelImplCopyWith<_$SpinningWheelUiModelImpl>
      get copyWith =>
          __$$SpinningWheelUiModelImplCopyWithImpl<_$SpinningWheelUiModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpinningWheelUiModelImplToJson(
      this,
    );
  }
}

abstract class _SpinningWheelUiModel implements SpinningWheelUiModel {
  const factory _SpinningWheelUiModel(
      {required final double angle,
      final String? selectedItem}) = _$SpinningWheelUiModelImpl;

  factory _SpinningWheelUiModel.fromJson(Map<String, dynamic> json) =
      _$SpinningWheelUiModelImpl.fromJson;

  @override
  double get angle;
  @override
  String? get selectedItem;

  /// Create a copy of SpinningWheelUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpinningWheelUiModelImplCopyWith<_$SpinningWheelUiModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
