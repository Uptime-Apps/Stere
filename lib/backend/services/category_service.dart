import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/category/category.dart';
import '../repositories/category_repository.dart';

abstract class CategoryService {
  Stream<List<Category>>? getCategories();
  Stream<List<Category>>? getCategoriesOrderedByName();
  Future<String?> getImageUrl(Category category);
  Future<String?> createCategory(Category category, File? image);
  Future<String?> deleteCategory(Category category);
}

class FirebaseCategoryService implements CategoryService {
  FirebaseCategoryService(this._categoryRepository);
  final CategoryRepository _categoryRepository;
  final String logName = '$categoriesFB.service';

  Stream<List<Category>>? mapCategories(
      Stream<List<Map<String, dynamic>>> documents) {
    return documents
        .map((event) => event.map((e) => Category.fromJson(e)).toList());
  }

  @override
  Stream<List<Category>>? getCategories() {
    try {
      return mapCategories(_categoryRepository.getCategories());
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Stream<List<Category>>? getCategoriesOrderedByName() {
    try {
      return mapCategories(_categoryRepository.getCategoriesOrderedByName());
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<String?> createCategory(Category category, File? image) async {
    if (image != null) {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final extension = image.path.split('.').last;
      final fileName = category.name.toLowerCase().replaceAll(' ', '_');
      final imagePath = '$categoriesFB/${uid}_$fileName.$extension';
      await _categoryRepository.uploadImage(
        imagePath,
        image,
      );
      category = category.copyWith(imagePath: imagePath);
    }
    final newId = await _categoryRepository.createCategory(category);
    return newId;
  }

  @override
  Future<String?> deleteCategory(Category category) async {
    try {
      if (category.imagePath != null) {
        final imagePath = Uri.decodeFull(
            category.imagePath!.split('?').first.split('/').last);
        await _categoryRepository.deleteCategoryImage(imagePath).whenComplete(
            () => log('Deleted image successfulyy: ${category.imagePath}',
                name: logName, level: 1));
      }
      await _categoryRepository.deleteCategory(category.id!).whenComplete(
          () => log('Deleted category successfully: ${category.id}'));
      return S.current.resultDeleteSuccess(category.name);
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<String?> getImageUrl(Category category) async {
    try {
      if (category.imagePath == null) return null;
      final downloadUrl =
          await _categoryRepository.getImageUrl(category.imagePath!);
      return downloadUrl;
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }
}

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return FirebaseCategoryService(categoryRepository);
});
