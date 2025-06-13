// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_screen_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventScreenUiModel {
  ViewState<List<EventBannerResDto>>? get dailyEvents =>
      throw _privateConstructorUsedError;
  ViewState<List<EventBannerResDto>>? get weeklyEvents =>
      throw _privateConstructorUsedError;

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventScreenUiModelCopyWith<EventScreenUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventScreenUiModelCopyWith<$Res> {
  factory $EventScreenUiModelCopyWith(
          EventScreenUiModel value, $Res Function(EventScreenUiModel) then) =
      _$EventScreenUiModelCopyWithImpl<$Res, EventScreenUiModel>;
  @useResult
  $Res call(
      {ViewState<List<EventBannerResDto>>? dailyEvents,
      ViewState<List<EventBannerResDto>>? weeklyEvents});

  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get dailyEvents;
  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get weeklyEvents;
}

/// @nodoc
class _$EventScreenUiModelCopyWithImpl<$Res, $Val extends EventScreenUiModel>
    implements $EventScreenUiModelCopyWith<$Res> {
  _$EventScreenUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyEvents = freezed,
    Object? weeklyEvents = freezed,
  }) {
    return _then(_value.copyWith(
      dailyEvents: freezed == dailyEvents
          ? _value.dailyEvents
          : dailyEvents // ignore: cast_nullable_to_non_nullable
              as ViewState<List<EventBannerResDto>>?,
      weeklyEvents: freezed == weeklyEvents
          ? _value.weeklyEvents
          : weeklyEvents // ignore: cast_nullable_to_non_nullable
              as ViewState<List<EventBannerResDto>>?,
    ) as $Val);
  }

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get dailyEvents {
    if (_value.dailyEvents == null) {
      return null;
    }

    return $ViewStateCopyWith<List<EventBannerResDto>, $Res>(
        _value.dailyEvents!, (value) {
      return _then(_value.copyWith(dailyEvents: value) as $Val);
    });
  }

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get weeklyEvents {
    if (_value.weeklyEvents == null) {
      return null;
    }

    return $ViewStateCopyWith<List<EventBannerResDto>, $Res>(
        _value.weeklyEvents!, (value) {
      return _then(_value.copyWith(weeklyEvents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventScreenUiModelImplCopyWith<$Res>
    implements $EventScreenUiModelCopyWith<$Res> {
  factory _$$EventScreenUiModelImplCopyWith(_$EventScreenUiModelImpl value,
          $Res Function(_$EventScreenUiModelImpl) then) =
      __$$EventScreenUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewState<List<EventBannerResDto>>? dailyEvents,
      ViewState<List<EventBannerResDto>>? weeklyEvents});

  @override
  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get dailyEvents;
  @override
  $ViewStateCopyWith<List<EventBannerResDto>, $Res>? get weeklyEvents;
}

/// @nodoc
class __$$EventScreenUiModelImplCopyWithImpl<$Res>
    extends _$EventScreenUiModelCopyWithImpl<$Res, _$EventScreenUiModelImpl>
    implements _$$EventScreenUiModelImplCopyWith<$Res> {
  __$$EventScreenUiModelImplCopyWithImpl(_$EventScreenUiModelImpl _value,
      $Res Function(_$EventScreenUiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyEvents = freezed,
    Object? weeklyEvents = freezed,
  }) {
    return _then(_$EventScreenUiModelImpl(
      dailyEvents: freezed == dailyEvents
          ? _value.dailyEvents
          : dailyEvents // ignore: cast_nullable_to_non_nullable
              as ViewState<List<EventBannerResDto>>?,
      weeklyEvents: freezed == weeklyEvents
          ? _value.weeklyEvents
          : weeklyEvents // ignore: cast_nullable_to_non_nullable
              as ViewState<List<EventBannerResDto>>?,
    ));
  }
}

/// @nodoc

class _$EventScreenUiModelImpl implements _EventScreenUiModel {
  _$EventScreenUiModelImpl({this.dailyEvents, this.weeklyEvents});

  @override
  final ViewState<List<EventBannerResDto>>? dailyEvents;
  @override
  final ViewState<List<EventBannerResDto>>? weeklyEvents;

  @override
  String toString() {
    return 'EventScreenUiModel(dailyEvents: $dailyEvents, weeklyEvents: $weeklyEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventScreenUiModelImpl &&
            (identical(other.dailyEvents, dailyEvents) ||
                other.dailyEvents == dailyEvents) &&
            (identical(other.weeklyEvents, weeklyEvents) ||
                other.weeklyEvents == weeklyEvents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dailyEvents, weeklyEvents);

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventScreenUiModelImplCopyWith<_$EventScreenUiModelImpl> get copyWith =>
      __$$EventScreenUiModelImplCopyWithImpl<_$EventScreenUiModelImpl>(
          this, _$identity);
}

abstract class _EventScreenUiModel implements EventScreenUiModel {
  factory _EventScreenUiModel(
          {final ViewState<List<EventBannerResDto>>? dailyEvents,
          final ViewState<List<EventBannerResDto>>? weeklyEvents}) =
      _$EventScreenUiModelImpl;

  @override
  ViewState<List<EventBannerResDto>>? get dailyEvents;
  @override
  ViewState<List<EventBannerResDto>>? get weeklyEvents;

  /// Create a copy of EventScreenUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventScreenUiModelImplCopyWith<_$EventScreenUiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
