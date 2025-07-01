// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResDto _$PaginationResDtoFromJson(Map<String, dynamic> json) =>
    PaginationResDto(
      page: (json['page'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? true,
    );

Map<String, dynamic> _$PaginationResDtoToJson(PaginationResDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
    };
