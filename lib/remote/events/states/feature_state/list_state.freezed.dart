// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventListState _$EventListStateFromJson(Map<String, dynamic> json) {
  return _EventDailyListState.fromJson(json);
}

/// @nodoc
mixin _$EventListState {
  PaginationResDto get pagination => throw _privateConstructorUsedError;
  List<EventBannerRawDto> get contents => throw _privateConstructorUsedError;

  /// Serializes this EventListState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventListStateCopyWith<EventListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventListStateCopyWith<$Res> {
  factory $EventListStateCopyWith(
          EventListState value, $Res Function(EventListState) then) =
      _$EventListStateCopyWithImpl<$Res, EventListState>;
  @useResult
  $Res call({PaginationResDto pagination, List<EventBannerRawDto> contents});
}

/// @nodoc
class _$EventListStateCopyWithImpl<$Res, $Val extends EventListState>
    implements $EventListStateCopyWith<$Res> {
  _$EventListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationResDto,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<EventBannerRawDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDailyListStateImplCopyWith<$Res>
    implements $EventListStateCopyWith<$Res> {
  factory _$$EventDailyListStateImplCopyWith(_$EventDailyListStateImpl value,
          $Res Function(_$EventDailyListStateImpl) then) =
      __$$EventDailyListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationResDto pagination, List<EventBannerRawDto> contents});
}

/// @nodoc
class __$$EventDailyListStateImplCopyWithImpl<$Res>
    extends _$EventListStateCopyWithImpl<$Res, _$EventDailyListStateImpl>
    implements _$$EventDailyListStateImplCopyWith<$Res> {
  __$$EventDailyListStateImplCopyWithImpl(_$EventDailyListStateImpl _value,
      $Res Function(_$EventDailyListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? contents = null,
  }) {
    return _then(_$EventDailyListStateImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationResDto,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<EventBannerRawDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDailyListStateImpl implements _EventDailyListState {
  const _$EventDailyListStateImpl(
      {this.pagination = const PaginationResDto(),
      final List<EventBannerRawDto> contents = const []})
      : _contents = contents;

  factory _$EventDailyListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDailyListStateImplFromJson(json);

  @override
  @JsonKey()
  final PaginationResDto pagination;
  final List<EventBannerRawDto> _contents;
  @override
  @JsonKey()
  List<EventBannerRawDto> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'EventListState(pagination: $pagination, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDailyListStateImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pagination, const DeepCollectionEquality().hash(_contents));

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDailyListStateImplCopyWith<_$EventDailyListStateImpl> get copyWith =>
      __$$EventDailyListStateImplCopyWithImpl<_$EventDailyListStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDailyListStateImplToJson(
      this,
    );
  }
}

abstract class _EventDailyListState implements EventListState {
  const factory _EventDailyListState(
      {final PaginationResDto pagination,
      final List<EventBannerRawDto> contents}) = _$EventDailyListStateImpl;

  factory _EventDailyListState.fromJson(Map<String, dynamic> json) =
      _$EventDailyListStateImpl.fromJson;

  @override
  PaginationResDto get pagination;
  @override
  List<EventBannerRawDto> get contents;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDailyListStateImplCopyWith<_$EventDailyListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
