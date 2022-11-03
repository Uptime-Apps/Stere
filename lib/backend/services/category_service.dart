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
  Future<List<Category>?> getCategoriesOrderedByName();
  Future<String?> getImageUrl(Category category);
  Future<String?> createCategory(Category category, File? image);
  Future<String?> deleteCategory(Category category);
}

class FirebaseCategoryService implements CategoryService {
  FirebaseCategoryService(this._categoryRepository);
  final CategoryRepository _categoryRepository;
  final String logName = '$categoriesFB.service';

  @override
  Stream<List<Category>>? getCategories() {
    try {
      final documents = _categoryRepository.getCategories();
      final mappedDocuments = documents
          .map((event) => event.map((e) => Category.fromJson(e)).toList());
      return mappedDocuments;
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<List<Category>?> getCategoriesOrderedByName() async {
    try {
      final documents = await _categoryRepository.getCategoriesOrderedByName();
      final mappedDocuments =
          documents.map((e) => Category.fromJson(e)).toList();
      return mappedDocuments;
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<String?> createCategory(Category category, File? image) async {
    try {
      if (image != null) {
        final uid = FirebaseAuth.instance.currentUser?.uid;
        final extension = image.path.split('.').last;
        final fileName = category.name.toLowerCase().replaceAll(' ', '_');
        final imagePath = '$rentalsFB/${uid}_$fileName.$extension';
        await _categoryRepository.uploadImage(
          imagePath,
          image,
        );
        category = category.copyWith(imagePath: imagePath);
      }
      final newId = await _categoryRepository.createCategory(category);
      return newId;
    } on Failure catch (e) {
      log(e.message, name: logName);
      return null;
    }
  }

  @override
  Future<String?> deleteCategory(Category category) async {
    try {
      final imagePath =
          Uri.decodeFull(category.imagePath!.split('?').first.split('/').last);
      await _categoryRepository.deleteCategoryImage(imagePath);
      await _categoryRepository.deleteCategory(category.id!);
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
