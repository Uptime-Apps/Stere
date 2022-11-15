import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../backend/services/category_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/snackbar.dart';
import 'category_form_state.dart';

final categoryFormControllerProvider = StateNotifierProvider.autoDispose<
    CategoryFormController, CategoryFormState>((ref) {
  return CategoryFormController(
    CategoryFormState(
      formKey: GlobalKey<FormState>(),
      result: AsyncValue.data(S.current.lblSave),
      nameController: TextEditingController(),
      tagController: TextEditingController(),
    ),
    ref.watch(categoryServiceProvider),
  );
});

class CategoryFormController extends StateNotifier<CategoryFormState> {
  CategoryFormController(CategoryFormState state, this._categoryService)
      : super(state);
  final CategoryService _categoryService;

  void setTags(List<String> tags) => state = state.copyWith(tags: tags);

  void toggleWithMiliage(bool? value) =>
      state = state.copyWith(isAutomotive: value ?? false);

  Future<void> submit(BuildContext context) async {
    final hasTags = state.tags.isNotEmpty;
    if (state.formKey.currentState!.validate() && hasTags) {
      state = state.copyWith(result: const AsyncValue.loading());
      final result = await _categoryService.createCategory(
        Category(
          name: state.nameController.text,
          isAutomotive: state.isAutomotive,
          tags: state.tags,
          creationDate: DateTime.now(),
        ),
        state.imageFile,
      );
      if (!mounted) return;
      if (result?.isEmpty ?? true) {
        showSimpleSnackbar(
            S.current.msgFailedCreateObject(state.nameController.text));
      } else {
        state = state.copyWith(result: AsyncValue.data(result!));
        Navigator.of(context).pop();
        showSimpleSnackbar(
            S.of(context).msgSuccessCreateObject(state.nameController.text));
      }
    }
    state = hasTags
        ? state.copyWith(errorText: null)
        : state.copyWith(errorText: S.current.emTagRequired);
  }

  void setImage(File? file) {
    state = state.copyWith(imageFile: file);
  }

  void clear() {
    state.nameController.clear();
    state.tagController.clear();
    state = state.copyWith(
      imageFile: null,
      isAutomotive: false,
      errorText: null,
      tags: [],
    );
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}
