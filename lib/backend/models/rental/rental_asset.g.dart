// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RentalAsset _$$_RentalAssetFromJson(Map<String, dynamic> json) =>
    _$_RentalAsset(
      id: json['id'] as String,
      damageReport: json['damageReport'] as String?,
      image: json['image'] as String?,
      notes: json['notes'] as String?,
      finalMileage: (json['finalMileage'] as num?)?.toDouble(),
      initialMileage: (json['initialMileage'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      name: json['name'] as String,
      rentalPrice: (json['rentalPrice'] as num).toDouble(),
      hoursRented: json['hoursRented'] as int,
      status: $enumDecode(_$RentalAssetStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_RentalAssetToJson(_$_RentalAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'damageReport': instance.damageReport,
      'image': instance.image,
      'notes': instance.notes,
      'finalMileage': instance.finalMileage,
      'initialMileage': instance.initialMileage,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'name': instance.name,
      'rentalPrice': instance.rentalPrice,
      'hoursRented': instance.hoursRented,
      'status': _$RentalAssetStatusEnumMap[instance.status]!,
    };

const _$RentalAssetStatusEnumMap = {
  RentalAssetStatus.ready: 'ready',
  RentalAssetStatus.incomplete: 'incomplete',
};
