import 'package:freezed_annotation/freezed_annotation.dart';

import '../status/rental_status.dart';
import 'rental_asset.dart';

part 'rental.freezed.dart';
part 'rental.g.dart';

@freezed
class Rental with _$Rental {
  factory Rental({
    String? id,
    //Employee Details
    required String employeeId,
    required String employeeEmail,
    String? employeeName,
    String? employeePhoto,
    //Rental Information
    required List<RentalAsset> assets,
    double? initialMileage,
    double? finalMileage,
    String? damageReport,
    String? notes,
    required int hoursRented,
    required double rentalPrice,
    //Client Details
    required String clientId,
    required String clientName,
    required String clientHousing,
    required String clientDeposit,
    required String clientPhone,
    required String clientEmail,
    //Rental Metadata
    String? backupPhone,
    String? referralType,
    required DateTime creationDate,
    required RentalStatus status,
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) => _$RentalFromJson(json);
}
