import 'package:json_annotation/json_annotation.dart';

part 'pagination_res_dto.g.dart';

@JsonSerializable()
class PaginationResDto {
  final int page;
  final int totalCount;
  final bool hasMore;

  const PaginationResDto({
    this.page = 0,
    this.totalCount = 0,
    this.hasMore = true,
  });

  /// ✅ JSON 역직렬화
  factory PaginationResDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationResDtoFromJson(json);

  /// ✅ 기본 상태 생성
  factory PaginationResDto.empty() => const PaginationResDto();

  /// ✅ 복사 생성자
  PaginationResDto copyWith({
    int? page,
    int? totalCount,
    bool? hasMore,
  }) {
    return PaginationResDto(
      page: page ?? this.page,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
