// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String?,
      imagePath: json['imagePath'] as String?,
      name: json['name'] as String,
      isAutomotive: json['isAutomotive'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'isAutomotive': instance.isAutomotive,
      'tags': instance.tags,
      'creationDate': instance.creationDate.toIso8601String(),
    };
