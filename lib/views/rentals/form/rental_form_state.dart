import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/referral_type/referral_type.dart';
import '../../../backend/models/rental/rental_asset.dart';
import '../../../backend/models/status/rental_status.dart';

part 'rental_form_state.freezed.dart';

@freezed
class RentalFormState with _$RentalFormState {
  factory RentalFormState({
    //Form Metadata
    @Default(0) int currentStep,
    @Default(false) bool validForm,
    required AsyncValue<Future<List<Asset>>?> assets,
    required AsyncValue<String> result,
    required GlobalKey<FormState> formKey,

    //Rental Metadata
    required AsyncValue<ReferralType?> referralType,
    required RentalStatus status,

    //Rental Information
    required AsyncValue<List<RentalAsset>> selectedAssets,
    // int? hoursRented,
    // required TextEditingController damageReportController,
    // required TextEditingController finalMileageController,
    // required TextEditingController initialMileageController,
    // required TextEditingController notesController,
    // required TextEditingController rentalPriceController,

    //Client Details
    required AsyncValue<String> clientDeposit,
    required TextEditingController clientEmailController,
    required TextEditingController backupPhoneController,
    required TextEditingController clientHousingController,
    required TextEditingController clientIdController,
    required TextEditingController clientNameController,
    required TextEditingController clientPhoneController,
  }) = _RentalFormState;
}
