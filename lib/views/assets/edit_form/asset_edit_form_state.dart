import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/category/category.dart';

part 'asset_edit_form_state.freezed.dart';

@freezed
class AssetEditFormState with _$AssetEditFormState {
  factory AssetEditFormState({
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController priceController,
    required AsyncValue<Asset> asset,
    required AsyncValue<String?> result,
    required AsyncValue<Stream<List<Category>>?> categories,
    required AsyncValue<Category> chosenCategory,
    File? imageFile,
    String? priceErrorText,
    @Default([]) List<ChoiceChip> tagChips,
    @Default([]) List<String> selectedTags,
  }) = _AssetFormState;
}
