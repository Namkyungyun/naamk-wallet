import 'package:json_annotation/json_annotation.dart';

part 'event_banner_raw_dto.g.dart';

@JsonSerializable()
class EventBannerRawDto {
  final double id;
  final String title;
  final String intro;
  final String imagePath;
  final String linkUrl;
  final bool participated;

  const EventBannerRawDto({
    this.id = 0,
    this.title = '',
    this.intro = '',
    this.imagePath = '',
    this.linkUrl = '',
    this.participated = false,
  });

  /// ✅ factory: 기본 빈 객체
  factory EventBannerRawDto.empty() => const EventBannerRawDto();

  /// ✅ factory: JSON 역직렬화
  factory EventBannerRawDto.fromJson(Map<String, dynamic> json) =>
      _$EventBannerRawDtoFromJson(json);

  /// ✅ toJson()
  Map<String, dynamic> toJson() => _$EventBannerRawDtoToJson(this);

  /// ✅ copyWith
  EventBannerRawDto copyWith({
    double? id,
    String? title,
    String? intro,
    String? imagePath,
    String? linkUrl,
    bool? participated,
  }) {
    return EventBannerRawDto(
      id: id ?? this.id,
      title: title ?? this.title,
      intro: intro ?? this.intro,
      imagePath: imagePath ?? this.imagePath,
      linkUrl: linkUrl ?? this.linkUrl,
      participated: participated ?? this.participated,
    );
  }
}
