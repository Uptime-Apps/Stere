// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rental _$$_RentalFromJson(Map<String, dynamic> json) => _$_Rental(
      id: json['id'] as String?,
      employeeId: json['employeeId'] as String,
      employeeEmail: json['employeeEmail'] as String,
      employeeName: json['employeeName'] as String?,
      employeePhoto: json['employeePhoto'] as String?,
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      clientHousing: json['clientHousing'] as String,
      clientDeposit: json['clientDeposit'] as String,
      clientPhone: json['clientPhone'] as String,
      clientEmail: json['clientEmail'] as String?,
      backupPhone: json['backupPhone'] as String?,
      assetId: json['assetId'] as String,
      assetName: json['assetName'] as String,
      assetPhoto: json['assetPhoto'] as String?,
      initialMileage: (json['initialMileage'] as num?)?.toDouble(),
      finalMileage: (json['finalMileage'] as num?)?.toDouble(),
      damageReport: json['damageReport'] as String?,
      notes: json['notes'] as String?,
      referralType: json['referralType'] as String?,
      creationDate: DateTime.parse(json['creationDate'] as String),
      hoursRented: json['hoursRented'] as int,
      rentalPrice: (json['rentalPrice'] as num).toDouble(),
      status: $enumDecode(_$RentalStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_RentalToJson(_$_Rental instance) => <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'employeeEmail': instance.employeeEmail,
      'employeeName': instance.employeeName,
      'employeePhoto': instance.employeePhoto,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'clientHousing': instance.clientHousing,
      'clientDeposit': instance.clientDeposit,
      'clientPhone': instance.clientPhone,
      'clientEmail': instance.clientEmail,
      'backupPhone': instance.backupPhone,
      'assetId': instance.assetId,
      'assetName': instance.assetName,
      'assetPhoto': instance.assetPhoto,
      'initialMileage': instance.initialMileage,
      'finalMileage': instance.finalMileage,
      'damageReport': instance.damageReport,
      'notes': instance.notes,
      'referralType': instance.referralType,
      'creationDate': instance.creationDate.toIso8601String(),
      'hoursRented': instance.hoursRented,
      'rentalPrice': instance.rentalPrice,
      'status': _$RentalStatusEnumMap[instance.status]!,
    };

const _$RentalStatusEnumMap = {
  RentalStatus.active: 'active',
  RentalStatus.completed: 'completed',
  RentalStatus.canceled: 'canceled',
  RentalStatus.overdue: 'overdue',
};
