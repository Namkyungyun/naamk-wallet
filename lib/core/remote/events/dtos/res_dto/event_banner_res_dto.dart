import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_banner_res_dto.g.dart';
part 'event_banner_res_dto.freezed.dart';

@freezed
class EventBannerResDto with _$EventBannerResDto {
  const factory EventBannerResDto({
    @Default(0) double id,
    @Default('') String title,
    @Default('') String intro,
    @Default('') String imagePath,
    @Default('') String linkUrl,
    @Default(false) bool participated,
  }) = _EventBannerResDto;

  factory EventBannerResDto.fromJson(Map<String, dynamic> json) =>
      _$EventBannerResDtoFromJson(json);
}
