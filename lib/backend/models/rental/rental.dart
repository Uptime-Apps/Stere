import 'package:freezed_annotation/freezed_annotation.dart';

import '../status/rental_status.dart';
import 'rental_asset.dart';

part 'rental.freezed.dart';
part 'rental.g.dart';

@freezed
class Rental with _$Rental {
  factory Rental({
    //Rental Metadata
    String? id,
    String? referralType,
    required DateTime creationDate,
    required RentalStatus status,

    //Employee Details
    String? employeeName,
    String? employeePhoto,
    required String employeeEmail,
    required String employeeId,

    //Rental Information
    required List<RentalAsset> assets,

    //Client Details
    required String clientDeposit,
    required String clientEmail,
    required String clientHousing,
    required String clientId,
    required String clientName,
    required String clientPhone,
    String? backupPhone,
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) => _$RentalFromJson(json);
}
