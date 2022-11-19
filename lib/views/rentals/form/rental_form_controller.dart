import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/rental/rental.dart';
import '../../../backend/models/rental/rental_asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/asset_service.dart';
import '../../../backend/services/rental_service.dart';
import '../../../core/components/others/filled_button.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/snackbar.dart';
import 'rental_form_state.dart';

class RentalFormController extends StateNotifier<RentalFormState> {
  static const logName = 'rental-form-controller';
  RentalFormController(RentalFormState state,
      {required this.service, required this.assetService})
      : super(state) {
    load();
  }

  final RentalService service;
  final AssetService assetService;

  void load() {
    state = state.copyWith(
        assets: AsyncValue.data(assetService.getAssetsOrderedByName()));
  }

  Future<void> nextStep(BuildContext context) async {
    if (state.currentStep < 2) {
      state = state.copyWith(currentStep: state.currentStep + 1);
      validateForm();
    } else {
      validateForm();
      log('here to submit', name: logName);
      final User currentUser = FirebaseAuth.instance.currentUser!;
      Rental rental = Rental(
        assets: state.selectedAssets,
        backupPhone: state.backupPhoneController.text,
        clientDeposit: state.clientDeposit.value!,
        clientEmail: state.clientEmailController.text,
        clientHousing: state.clientHousingController.text,
        clientId: state.clientIdController.text,
        clientName: state.clientNameController.text,
        clientPhone: state.clientPhoneController.text,
        creationDate: DateTime.now(),
        employeeEmail: currentUser.email!,
        employeeId: currentUser.uid,
        employeeName: currentUser.displayName,
        employeePhoto: currentUser.photoURL,
        referralType: state.referralType.value?.name,
        status: RentalStatus.active,
      );
      await service.create(rental);
      Navigator.of(context).pop();
      showSimpleSnackbar(
          S.current.msgSuccessCreateObject(S.current.lblRentals(1)));
    }
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

  bool validStepAvailableAssets() {
    bool hasSelections = state.selectedAssets.isNotEmpty;
    if (hasSelections) {
      bool allReady = state.selectedAssets
          .map((element) => element.status == RentalAssetStatus.ready)
          .reduce((value, element) => value && element);
      return allReady;
    }
    return false;
  }

  bool validStepClientDetails() {
    bool housing = state.clientHousingController.text.isNotEmpty;
    bool name = state.clientNameController.text.isNotEmpty;
    bool phone = state.clientPhoneController.text.isNotEmpty;
    bool backupPhone = state.backupPhoneController.text.isNotEmpty;
    bool deposit = state.clientDeposit.value != null;
    bool email = state.clientEmailController.text.isNotEmpty;
    bool id = state.clientIdController.value.text.isNotEmpty;
    return name && id && deposit && housing && phone && backupPhone && email;
  }

  String validateForm() {
    bool formStatus;
    switch (state.currentStep) {
      case 0:
        formStatus = validStepAvailableAssets();
        break;
      case 1:
        formStatus = validStepClientDetails();
        break;
      case 2:
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

  Future<List<Asset>> getUnselectedAssets() async {
    var currentSelections = state.selectedAssets.map((e) => e.id);
    var assets = await state.assets.value!;
    return assets.where((e) => currentSelections.contains(e.id!)).toList();
  }

  void addSelection(Asset asset) {
    var currentAssets = state.selectedAssets.toList();
    currentAssets.add(RentalAsset(
      id: asset.id!,
      name: asset.name,
      categoryId: asset.categoryId,
      categoryName: asset.categoryName,
      image: asset.imagePath,
      hoursRented: 0,
      rentalPrice: 0,
      status: RentalAssetStatus.incomplete,
    ));
    state = state.copyWith(selectedAssets: currentAssets);
    validateForm();
  }

  void editSelection(int index, RentalAsset rAsset) {
    var currentAssets = state.selectedAssets.toList();
    currentAssets.removeAt(index);
    currentAssets.add(rAsset);
    state = state.copyWith(selectedAssets: currentAssets);
    validateForm();
  }

  void removeSelection(String assetId) {
    var currentAssets = state.selectedAssets.toList();
    currentAssets.removeWhere((element) => element.id == assetId);
    state = state.copyWith(selectedAssets: currentAssets);
    validateForm();
  }
}

final rentalFormControllerProvider =
    StateNotifierProvider.autoDispose<RentalFormController, RentalFormState>(
        (ref) {
  return RentalFormController(
      RentalFormState(
          formKey: GlobalKey<FormState>(),
          assets: const AsyncValue.data(null),
          clientDeposit: const AsyncValue.loading(),
          clientEmailController: TextEditingController(),
          clientHousingController: TextEditingController(),
          clientIdController: TextEditingController(),
          clientNameController: TextEditingController(),
          clientPhoneController: TextEditingController(),
          backupPhoneController: TextEditingController(),
          referralType: const AsyncValue.loading(),
          result: AsyncValue.data(S.current.lblSave),
          status: RentalStatus.active,
          currentStep: 0),
      assetService: ref.watch(assetServiceProvider),
      service: ref.watch(rentalServiceProvider));
});
