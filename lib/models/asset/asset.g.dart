// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Asset _$$_AssetFromJson(Map<String, dynamic> json) => _$_Asset(
      id: json['id'] as String?,
      imagePath: json['imagePath'] as String?,
      isAutomotive: json['isAutomotive'] as bool? ?? false,
      mileage: json['mileage'] as int? ?? 0,
      name: json['name'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isAutomotive': instance.isAutomotive,
      'mileage': instance.mileage,
      'name': instance.name,
      'creationDate': instance.creationDate.toIso8601String(),
      'price': instance.price,
      'status': instance.status,
      'tags': instance.tags,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
    };
