// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDailyListStateImpl _$$EventDailyListStateImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDailyListStateImpl(
      pagination: json['pagination'] == null
          ? const PaginationResDto()
          : PaginationResDto.fromJson(
              json['pagination'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
              ?.map(
                  (e) => EventBannerRawDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventDailyListStateImplToJson(
        _$EventDailyListStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'contents': instance.contents,
    };
