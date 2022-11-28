// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rental _$$_RentalFromJson(Map<String, dynamic> json) => _$_Rental(
      id: json['id'] as String?,
      referralType: json['referralType'] as String?,
      creationDate: DateTime.parse(json['creationDate'] as String),
      status: $enumDecode(_$RentalStatusEnumMap, json['status']),
      employeeName: json['employeeName'] as String?,
      employeePhoto: json['employeePhoto'] as String?,
      employeeEmail: json['employeeEmail'] as String,
      employeeId: json['employeeId'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => RentalAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientDeposit: json['clientDeposit'] as String,
      clientEmail: json['clientEmail'] as String,
      clientHousing: json['clientHousing'] as String,
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String,
      backupPhone: json['backupPhone'] as String?,
    );

Map<String, dynamic> _$$_RentalToJson(_$_Rental instance) => <String, dynamic>{
      'id': instance.id,
      'referralType': instance.referralType,
      'creationDate': instance.creationDate.toIso8601String(),
      'status': _$RentalStatusEnumMap[instance.status]!,
      'employeeName': instance.employeeName,
      'employeePhoto': instance.employeePhoto,
      'employeeEmail': instance.employeeEmail,
      'employeeId': instance.employeeId,
      'assets': instance.assets.map((e) => e.toJson()).toList(),
      'clientDeposit': instance.clientDeposit,
      'clientEmail': instance.clientEmail,
      'clientHousing': instance.clientHousing,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'clientPhone': instance.clientPhone,
      'backupPhone': instance.backupPhone,
    };

const _$RentalStatusEnumMap = {
  RentalStatus.active: 'active',
  RentalStatus.closed: 'closed',
  RentalStatus.canceled: 'canceled',
  RentalStatus.overdue: 'overdue',
};
