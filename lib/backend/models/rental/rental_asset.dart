import 'package:freezed_annotation/freezed_annotation.dart';

import '../status/rental_status.dart';

part 'rental_asset.freezed.dart';
part 'rental_asset.g.dart';

@freezed
class RentalAsset with _$RentalAsset {
  factory RentalAsset({
    required String id,
    String? damageReport,
    String? image,
    String? notes,
    double? finalMileage,
    double? initialMileage,
    DateTime? returnTime,
    required String categoryId,
    required String categoryName,
    required String name,
    required double rentalPrice,
    required int hoursRented,
    required RentalAssetStatus status,
  }) = _RentalAsset;

  factory RentalAsset.fromJson(Map<String, dynamic> json) =>
      _$RentalAssetFromJson(json);
}
