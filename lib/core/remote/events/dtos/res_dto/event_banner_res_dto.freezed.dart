// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_banner_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventBannerResDto _$EventBannerResDtoFromJson(Map<String, dynamic> json) {
  return _EventBannerResDto.fromJson(json);
}

/// @nodoc
mixin _$EventBannerResDto {
  double get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get intro => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get linkUrl => throw _privateConstructorUsedError;
  bool get participated => throw _privateConstructorUsedError;

  /// Serializes this EventBannerResDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventBannerResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventBannerResDtoCopyWith<EventBannerResDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventBannerResDtoCopyWith<$Res> {
  factory $EventBannerResDtoCopyWith(
          EventBannerResDto value, $Res Function(EventBannerResDto) then) =
      _$EventBannerResDtoCopyWithImpl<$Res, EventBannerResDto>;
  @useResult
  $Res call(
      {double id,
      String title,
      String intro,
      String imagePath,
      String linkUrl,
      bool participated});
}

/// @nodoc
class _$EventBannerResDtoCopyWithImpl<$Res, $Val extends EventBannerResDto>
    implements $EventBannerResDtoCopyWith<$Res> {
  _$EventBannerResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventBannerResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? intro = null,
    Object? imagePath = null,
    Object? linkUrl = null,
    Object? participated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      participated: null == participated
          ? _value.participated
          : participated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventBannerResDtoImplCopyWith<$Res>
    implements $EventBannerResDtoCopyWith<$Res> {
  factory _$$EventBannerResDtoImplCopyWith(_$EventBannerResDtoImpl value,
          $Res Function(_$EventBannerResDtoImpl) then) =
      __$$EventBannerResDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double id,
      String title,
      String intro,
      String imagePath,
      String linkUrl,
      bool participated});
}

/// @nodoc
class __$$EventBannerResDtoImplCopyWithImpl<$Res>
    extends _$EventBannerResDtoCopyWithImpl<$Res, _$EventBannerResDtoImpl>
    implements _$$EventBannerResDtoImplCopyWith<$Res> {
  __$$EventBannerResDtoImplCopyWithImpl(_$EventBannerResDtoImpl _value,
      $Res Function(_$EventBannerResDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventBannerResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? intro = null,
    Object? imagePath = null,
    Object? linkUrl = null,
    Object? participated = null,
  }) {
    return _then(_$EventBannerResDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      participated: null == participated
          ? _value.participated
          : participated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventBannerResDtoImpl implements _EventBannerResDto {
  const _$EventBannerResDtoImpl(
      {this.id = 0,
      this.title = '',
      this.intro = '',
      this.imagePath = '',
      this.linkUrl = '',
      this.participated = false});

  factory _$EventBannerResDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventBannerResDtoImplFromJson(json);

  @override
  @JsonKey()
  final double id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String intro;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String linkUrl;
  @override
  @JsonKey()
  final bool participated;

  @override
  String toString() {
    return 'EventBannerResDto(id: $id, title: $title, intro: $intro, imagePath: $imagePath, linkUrl: $linkUrl, participated: $participated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventBannerResDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.intro, intro) || other.intro == intro) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.participated, participated) ||
                other.participated == participated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, intro, imagePath, linkUrl, participated);

  /// Create a copy of EventBannerResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventBannerResDtoImplCopyWith<_$EventBannerResDtoImpl> get copyWith =>
      __$$EventBannerResDtoImplCopyWithImpl<_$EventBannerResDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventBannerResDtoImplToJson(
      this,
    );
  }
}

abstract class _EventBannerResDto implements EventBannerResDto {
  const factory _EventBannerResDto(
      {final double id,
      final String title,
      final String intro,
      final String imagePath,
      final String linkUrl,
      final bool participated}) = _$EventBannerResDtoImpl;

  factory _EventBannerResDto.fromJson(Map<String, dynamic> json) =
      _$EventBannerResDtoImpl.fromJson;

  @override
  double get id;
  @override
  String get title;
  @override
  String get intro;
  @override
  String get imagePath;
  @override
  String get linkUrl;
  @override
  bool get participated;

  /// Create a copy of EventBannerResDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventBannerResDtoImplCopyWith<_$EventBannerResDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
