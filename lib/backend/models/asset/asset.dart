import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  factory Asset({
    String? id,
    String? imagePath,
    @Default(false) bool isAutomotive,
    @Default(0.0) double mileage,
    required String name,
    required DateTime creationDate,
    required num price,
    required String status,
    required String categoryId,
    required String categoryName,
    // All of this are required but for testing they will be optional
    List<String>? tags,
  }) = _Asset;
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
