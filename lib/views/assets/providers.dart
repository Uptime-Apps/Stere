import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/services/asset_service.dart';
import '../../backend/services/category_service.dart';
import '../../l10n/generated/l10n.dart';
import 'form/asset_form_controller.dart';
import 'form/asset_form_state.dart';

final categoryImageProvider =
    FutureProvider.autoDispose.family<String?, String?>((ref, imagePath) async {
  final result =
      await ref.watch(categoryServiceProvider).getImageUrl(imagePath);
  return result;
});

final assetImageProvider =
    FutureProvider.autoDispose.family<String?, String?>((ref, imagePath) async {
  final result = await ref.watch(assetServiceProvider).getImageUrl(imagePath);
  return result;
});

final assetFormControllerProvider =
    StateNotifierProvider.autoDispose<AssetFormController, AssetFormState>(
        (ref) {
  return AssetFormController(
    AssetFormState(
      formKey: GlobalKey<FormState>(),
      result: AsyncValue.data(S.current.lblSave),
      priceController: TextEditingController(),
      nameController: TextEditingController(),
      categories: const AsyncValue.loading(),
      chosenCategory: const AsyncValue.loading(),
    ),
    categoryService: ref.watch(categoryServiceProvider),
    assetService: ref.watch(assetServiceProvider),
  );
});
