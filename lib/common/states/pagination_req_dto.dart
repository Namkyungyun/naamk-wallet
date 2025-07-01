import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_req_dto.freezed.dart';
part 'pagination_req_dto.g.dart';

@freezed
class PaginationReqDto with _$PaginationReqDto {
  const factory PaginationReqDto({
    @Default(0) int page,
    @Default(10) int size,
  }) = _PaginationReqDto;

  factory PaginationReqDto.empty() => const PaginationReqDto();

  factory PaginationReqDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationReqDtoFromJson(json);
}
