import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const Category._();
  factory Category({
    String? id,
    String? imagePath,
    required String name,
    required bool isAutomotive,
    required List<String> tags,
    required DateTime creationDate,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
