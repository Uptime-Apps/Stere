import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_form_state.freezed.dart';

@freezed
class CategoryFormState with _$CategoryFormState {
  factory CategoryFormState({
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController tagController,
    @Default(false) bool isAutomotive,
    required AsyncValue<String> result,
    String? errorText,
    File? imageFile,
    @Default([]) List<String> tags,
  }) = _CategoryFormState;
}
