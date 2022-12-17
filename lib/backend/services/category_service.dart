import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/category/category.dart';
import '../repositories/category_repository.dart';
import 'asset_service.dart';

abstract class CategoryService {
  Stream<List<Category>>? getCategories();
  Stream<List<Category>>? getCategoriesOrderedByName();
  Future<String?> getImageUrl(String? imagePath);
  Future<String?> createCategory(Category category, File? image);
  Future<String?> deleteCategory(Category category);
}

class FirebaseCategoryService implements CategoryService {
  FirebaseCategoryService(this._categoryRepository, this._assetService);
  final CategoryRepository _categoryRepository;
  final AssetService _assetService;
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
      final id = category.id!;
      // get assets from this category
      var assets = await _assetService.getAssetsByCategory(id);
      // delete assets if there are any
      final String categoryLD = '${category.name} [${category.id}]';
      if (assets?.isNotEmpty ?? false) {
        for (var e in assets!) {
          await _assetService.delete(e).whenComplete(() => log(
              'Deleted Asset ${e.id} (${e.name}) from Category $categoryLD',
              name: logName));
        }
      }
      // delete image
      if (category.imagePath != null) {
        final imagePath = Uri.decodeFull(
            category.imagePath!.split('?').first.split('/').last);
        await _categoryRepository.deleteImage(imagePath).whenComplete(() => log(
            'Deleted image successfuly: ${category.imagePath}',
            name: logName,
            level: 1));
      }
      await _categoryRepository
          .deleteCategory(id)
          .then(
            (_) => log(
                '${S.current.msgSuccessDeleteObject(S.current.lblCategories(1))}: $categoryLD',
                name: logName),
          )
          .onError(
            (error, stackTrace) => log(
              '${S.current.msgFailedDeleteObject(S.current.lblCategories(1))}: $categoryLD',
              error: error,
              stackTrace: stackTrace,
              name: logName,
            ),
          );
      return S.current.msgSuccessDeleteObject(category.name);
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<String?> getImageUrl(String? imagePath) async {
    try {
      return (imagePath?.isNotEmpty ?? false)
          ? await _categoryRepository.getImageUrl(imagePath!)
          : null;
    } on Failure catch (e) {
      log(e.message, name: logName);
    } on FirebaseException catch (e) {
      log('Failed to load image\n${e.message}', name: logName);
    }
    return null;
  }
}

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  final assetService = ref.watch(assetServiceProvider);
  return FirebaseCategoryService(categoryRepository, assetService);
});
