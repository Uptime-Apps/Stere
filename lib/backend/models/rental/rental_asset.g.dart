// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RentalAsset _$$_RentalAssetFromJson(Map<String, dynamic> json) =>
    _$_RentalAsset(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryName: json['categoryName'] as String,
      categoryId: json['categoryId'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_RentalAssetToJson(_$_RentalAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'image': instance.image,
    };
