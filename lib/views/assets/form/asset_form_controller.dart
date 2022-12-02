import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/category/category.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/asset_service.dart';
import '../../../backend/services/category_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/snackbar.dart';
import 'asset_form_state.dart';

final assetImageProvider =
    FutureProvider.autoDispose.family<String?, String>((ref, imagePath) async {
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

class AssetFormController extends StateNotifier<AssetFormState> {
  AssetFormController(AssetFormState state,
      {required this.categoryService, required this.assetService})
      : super(state) {
    loadCategories();
  }

  final CategoryService categoryService;
  final AssetService assetService;

  Future<void> loadCategories() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final result = categoryService.getCategoriesOrderedByName();
    state = state.copyWith(categories: AsyncValue.data(result));
  }

  void updateTagStatus(String e, bool status) {
    final newSelections = state.selectedTags.toList();
    if (status) {
      newSelections.add(e);
    } else {
      newSelections.remove(e);
    }
    state = state.copyWith(selectedTags: newSelections);
  }

  void chooseCategory(Category? category) {
    if (category != null) {
      state = state.copyWith(
        chosenCategory: AsyncValue.data(category),
        selectedTags: [],
      );
    } else {
      state = state.copyWith(
        chosenCategory: const AsyncValue.loading(),
      );
    }
  }

  Future<void> submit(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      state = state.copyWith(result: const AsyncValue.loading());
      final category = state.chosenCategory.value;
      if (category != null) {
        final result = await assetService.create(
          Asset(
            creationDate: DateTime.now(),
            name: state.nameController.text,
            price: double.parse(state.priceController.text.trim()),
            status: AssetStatus.available,
            categoryId: category.id!,
            categoryName: category.name,
            tags: state.selectedTags,
            isAutomotive: category.isAutomotive,
          ),
          state.imageFile,
        );
        state = state.copyWith(result: AsyncValue.data(result));
        final lang = S.current;
        if (result?.isEmpty ?? true) {
          showSimpleSnackbar(
              lang.msgFailedCreateObject(state.nameController.text));
        } else {
          showSimpleSnackbar(
              lang.msgSuccessCreateObject(state.nameController.text));
          Navigator.of(context).pop();
        }
      } else {
        state =
            state.copyWith(result: AsyncValue.data(S.current.emFieldRequired));
      }
    }
  }

  void setImage(File? file) {
    state = state.copyWith(imageFile: file);
  }

  void clear() {
    state.nameController.clear();
    state = state.copyWith(
      imageFile: null,
      tagChips: [],
    );
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}
