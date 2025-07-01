// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_banner_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventBannerReqDtoImpl _$$EventBannerReqDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventBannerReqDtoImpl(
      pagination: json['pagination'] == null
          ? const PaginationReqDto()
          : PaginationReqDto.fromJson(
              json['pagination'] as Map<String, dynamic>),
      options: json['options'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$EventBannerReqDtoImplToJson(
        _$EventBannerReqDtoImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'options': instance.options,
    };
