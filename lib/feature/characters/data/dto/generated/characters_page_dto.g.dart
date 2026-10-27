// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../characters_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersPageDto _$CharactersPageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharactersPageDto', json, ($checkedConvert) {
      final val = CharactersPageDto(
        info: $checkedConvert(
          'info',
          (v) => PageInfoDto.fromJson(v as Map<String, dynamic>),
        ),
        results: $checkedConvert(
          'results',
          (v) => (v as List<dynamic>)
              .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });
