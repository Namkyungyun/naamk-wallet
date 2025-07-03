import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/remote/common/pagination_dto/pagination_req_dto.dart';

part 'event_banner_req_dto.g.dart';
part 'event_banner_req_dto.freezed.dart';

@freezed
class EventBannerReqDto with _$EventBannerReqDto {
  const factory EventBannerReqDto({
    @Default(PaginationReqDto()) PaginationReqDto pagination,
    @Default({}) Map<String, dynamic> options,
  }) = _EventBannerReqDto;

  factory EventBannerReqDto.fromJson(Map<String, dynamic> json) =>
      _$EventBannerReqDtoFromJson(json);
}
