import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_asset.freezed.dart';
part 'rental_asset.g.dart';

@freezed
class RentalAsset with _$RentalAsset {
  factory RentalAsset({
    required String id,
    required String name,
    required String categoryName,
    required String categoryId,
    String? image,
  }) = _RentalAsset;

  factory RentalAsset.fromJson(Map<String, dynamic> json) =>
      _$RentalAssetFromJson(json);
}
