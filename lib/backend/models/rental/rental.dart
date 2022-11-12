import 'package:freezed_annotation/freezed_annotation.dart';

import '../status/rental_status.dart';

part 'rental.freezed.dart';
part 'rental.g.dart';

@freezed
class Rental with _$Rental {
  factory Rental({
    String? id,
    required String employeeId,
    required String employeeEmail,
    String? employeeName,
    String? employeePhoto,
    required String clientId,
    required String clientName,
    required String clientHousing,
    required String clientDeposit,
    required String clientPhone,
    String? backupPhone,
    required String assetId,
    required String assetName,
    String? assetPhoto,
    double? initialMileage,
    double? finalMileage,
    String? damageReport,
    String? notes,
    required String referralType,
    required DateTime creationDate,
    required int hoursRented,
    required double rentalPrice,
    required RentalStatus status,
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) => _$RentalFromJson(json);
}
