// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationReqDtoImpl _$$PaginationReqDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationReqDtoImpl(
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$PaginationReqDtoImplToJson(
        _$PaginationReqDtoImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };
