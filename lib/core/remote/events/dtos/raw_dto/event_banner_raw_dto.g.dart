// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_banner_raw_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBannerRawDto _$EventBannerRawDtoFromJson(Map<String, dynamic> json) =>
    EventBannerRawDto(
      id: (json['id'] as num?)?.toDouble() ?? 0,
      title: json['title'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      linkUrl: json['linkUrl'] as String? ?? '',
      participated: json['participated'] as bool? ?? false,
    );

Map<String, dynamic> _$EventBannerRawDtoToJson(EventBannerRawDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'intro': instance.intro,
      'imagePath': instance.imagePath,
      'linkUrl': instance.linkUrl,
      'participated': instance.participated,
    };
