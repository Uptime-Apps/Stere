import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/referral_type/referral_type.dart';
import '../../../backend/models/status/rental_status.dart';

part 'rental_form_state.freezed.dart';

@freezed
class RentalFormState with _$RentalFormState {
  factory RentalFormState({
    @Default(0) int currentStep,
    @Default(false) bool validForm,
    String? assetPhoto,
    String? clientId,
    String? employeePhoto,
    int? hoursRented,
    required AsyncValue<Asset> chosenAsset,
    required AsyncValue<ReferralType> referralType,
    required AsyncValue<Stream<List<Asset>>?> assets,
    required AsyncValue<String> clientDeposit,
    required AsyncValue<String> result,
    required DateTime creationDate,
    required GlobalKey<FormState> formKey,
    required RentalStatus status,
    required String employeeId,
    required String employeeName,
    required TextEditingController backupPhoneController,
    required TextEditingController clientHousingController,
    required TextEditingController clientNameController,
    required TextEditingController clientPhoneController,
    required TextEditingController damageReportController,
    required TextEditingController finalMileageController,
    required TextEditingController initialMileageController,
    required TextEditingController notesController,
    required TextEditingController rentalPriceController,
  }) = _RentalFormState;
}
