// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_banner_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventBannerResDtoImpl _$$EventBannerResDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventBannerResDtoImpl(
      id: (json['id'] as num?)?.toDouble() ?? 0,
      title: json['title'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      linkUrl: json['linkUrl'] as String? ?? '',
      participated: json['participated'] as bool? ?? false,
    );

Map<String, dynamic> _$$EventBannerResDtoImplToJson(
        _$EventBannerResDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'intro': instance.intro,
      'imagePath': instance.imagePath,
      'linkUrl': instance.linkUrl,
      'participated': instance.participated,
    };
