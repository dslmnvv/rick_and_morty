import 'package:json_annotation/json_annotation.dart';

part 'generated/page_info_dto.g.dart';

@JsonSerializable()
class PageInfoDto {
  const PageInfoDto({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory PageInfoDto.fromJson(Map<String, Object?> json) =>
      _$PageInfoDtoFromJson(json);

  final int count;
  final int pages;
  final String? next;
  final String? prev;
}
