// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewState<T> {
  ResponseState get state => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewStateCopyWith<T, ViewState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<T, $Res> {
  factory $ViewStateCopyWith(
          ViewState<T> value, $Res Function(ViewState<T>) then) =
      _$ViewStateCopyWithImpl<T, $Res, ViewState<T>>;
  @useResult
  $Res call({ResponseState state, T? data, String? exception});
}

/// @nodoc
class _$ViewStateCopyWithImpl<T, $Res, $Val extends ViewState<T>>
    implements $ViewStateCopyWith<T, $Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewStateImplCopyWith<T, $Res>
    implements $ViewStateCopyWith<T, $Res> {
  factory _$$ViewStateImplCopyWith(
          _$ViewStateImpl<T> value, $Res Function(_$ViewStateImpl<T>) then) =
      __$$ViewStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({ResponseState state, T? data, String? exception});
}

/// @nodoc
class __$$ViewStateImplCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$ViewStateImpl<T>>
    implements _$$ViewStateImplCopyWith<T, $Res> {
  __$$ViewStateImplCopyWithImpl(
      _$ViewStateImpl<T> _value, $Res Function(_$ViewStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$ViewStateImpl<T>(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ViewStateImpl<T> implements _ViewState<T> {
  const _$ViewStateImpl(
      {this.state = ResponseState.EMPTY,
      this.data = null,
      this.exception = null});

  @override
  @JsonKey()
  final ResponseState state;
  @override
  @JsonKey()
  final T? data;
  @override
  @JsonKey()
  final String? exception;

  @override
  String toString() {
    return 'ViewState<$T>(state: $state, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewStateImpl<T> &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(data), exception);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewStateImplCopyWith<T, _$ViewStateImpl<T>> get copyWith =>
      __$$ViewStateImplCopyWithImpl<T, _$ViewStateImpl<T>>(this, _$identity);
}

abstract class _ViewState<T> implements ViewState<T> {
  const factory _ViewState(
      {final ResponseState state,
      final T? data,
      final String? exception}) = _$ViewStateImpl<T>;

  @override
  ResponseState get state;
  @override
  T? get data;
  @override
  String? get exception;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewStateImplCopyWith<T, _$ViewStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
