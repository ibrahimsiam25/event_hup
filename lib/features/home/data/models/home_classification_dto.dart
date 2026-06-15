import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/home_category_entity.dart';

part 'home_classification_dto.freezed.dart';

@freezed
class HomeClassificationDto with _$HomeClassificationDto {
  const factory HomeClassificationDto({
    @Default('') String id,
    @Default('') String name,
  }) = _HomeClassificationDto;

  const HomeClassificationDto._();

  factory HomeClassificationDto.fromJson(Map<String, dynamic> json) {
    final segment = json['segment'];
    if (segment is! Map) {
      return const HomeClassificationDto();
    }
    return HomeClassificationDto(
      id: segment['id'] is String ? segment['id'] as String : '',
      name: segment['name'] is String ? segment['name'] as String : '',
    );
  }

  HomeCategoryEntity? toEntity() {
    final categoryName = name.trim();
    if (categoryName.isEmpty) return null;

    return HomeCategoryEntity(
      id: id.trim(),
      name: categoryName == 'Undefined' ? 'Default' : categoryName,
      apiName: categoryName,
    );
  }
}
