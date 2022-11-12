import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/asset_service.dart';
import '../../../core/components/others/filled_button.dart';
import '../../../l10n/generated/l10n.dart';
import 'rental_form_state.dart';

class RentalFormController extends StateNotifier<RentalFormState> {
  RentalFormController(RentalFormState state, {required this.assetService})
      : super(state) {
    load();
  }

  final AssetService assetService;

  void load() {
    state = state.copyWith(
        assets: AsyncValue.data(assetService.getAssetsOrderedByName()));
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
    validateForm();
  }

  void setStep(int step) {
    state = state.copyWith(currentStep: step);
    validateForm();
  }

  void exitForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).msgAreYouSure),
          content: Text(S.of(context).msgYouHaveInformation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).lblYes),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              label: Text(S.of(context).lblNo),
            ),
          ],
        );
      },
    );
  }

  void cancelStep(BuildContext context) {
    (state.currentStep == 0)
        ? exitForm(context)
        : state = state.copyWith(currentStep: state.currentStep - 1);
    validateForm();
  }

  bool validStepAvailableAssets() => state.chosenAsset.value != null;

  bool validStepRentalInformation() =>
      state.hoursRented != null && state.rentalPriceController.text.isNotEmpty;

  bool validStepClientDetails() {
    bool housing = state.clientHousingController.text.isNotEmpty;
    bool name = state.clientNameController.text.isNotEmpty;
    bool phone = state.clientPhoneController.text.isNotEmpty;
    bool deposit = state.clientDeposit.value != null;
    return housing && deposit && name && phone;
  }

  String validateForm() {
    bool formStatus;
    switch (state.currentStep) {
      case 0:
        formStatus = validStepAvailableAssets();
        break;
      case 1:
        formStatus = validStepRentalInformation();
        break;
      case 2:
        formStatus = validStepClientDetails();
        break;
      case 3:
        formStatus = true;
        break;
      default:
        formStatus = false;
    }
    state = state.copyWith(validForm: formStatus);
    return S.current.msgFormStatus(formStatus);
  }

  void selectDeposit(String? deposit) {
    state = state.copyWith(
        clientDeposit: deposit != null
            ? AsyncValue.data(deposit)
            : const AsyncValue.loading());
    validateForm();
  }

  void selectAsset(Asset? asset) {
    state = state.copyWith(
        chosenAsset: asset != null
            ? AsyncValue.data(asset)
            : const AsyncValue.loading());
    validateForm();
  }

  void selectHours(int hours) {
    state = state.copyWith(hoursRented: hours);
    validateForm();
  }
}

final rentalFormControllerProvider =
    StateNotifierProvider.autoDispose<RentalFormController, RentalFormState>(
        (ref) {
  return RentalFormController(
      RentalFormState(
        formKey: GlobalKey<FormState>(),
        assets: const AsyncValue.loading(),
        backupPhoneController: TextEditingController(),
        chosenAsset: const AsyncValue.loading(),
        clientDeposit: const AsyncValue.loading(),
        clientHousingController: TextEditingController(),
        clientNameController: TextEditingController(),
        clientPhoneController: TextEditingController(),
        creationDate: DateTime.now(),
        damageReportController: TextEditingController(),
        employeeId: FirebaseAuth.instance.currentUser?.uid ?? '',
        employeeName: FirebaseAuth.instance.currentUser?.displayName ?? '',
        finalMileageController: TextEditingController(),
        initialMileageController: TextEditingController(),
        notesController: TextEditingController(),
        referralType: const AsyncValue.loading(),
        rentalPriceController: TextEditingController(),
        result: AsyncValue.data(S.current.lblSave),
        status: RentalStatus.active,
      ),
      assetService: ref.watch(assetServiceProvider));
});
