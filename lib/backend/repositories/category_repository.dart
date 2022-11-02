import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category/category.dart';

abstract class CategoryRepository {
  Stream<List<Map<String, dynamic>>> getCategories();
  Future<List<Map<String, dynamic>>> getCategoriesOrderedByName();
  Future<String> getImageUrl(String path);
  Future<String> uploadImage(String name, File image);
  Future<String> createCategory(Category category);
  Future<void> deleteCategory(String id);
  Future<void> deleteCategoryImage(String imagePath);
}

class FirebaseCategoryRepository implements CategoryRepository {
  final _firestore = FirebaseFirestore.instance.collection(stCategories);
  final _ref = FirebaseFirestore.instance
      .collection(stCategories)
      .withConverter<Category>(
        fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
        toFirestore: (category, _) => category.toJson(),
      );

  @override
  Future<String> createCategory(Category category) async {
    try {
      final res = await _ref.add(category);
      return res.id;
    } on Exception catch (e) {
      throw Failure(
          message: S.current.resultCreateFailure(category.name), exception: e);
    }
  }

  @override
  Future<String> getImageUrl(String path) =>
      FirebaseStorage.instance.ref(path).getDownloadURL();

  @override
  Future<String> uploadImage(String name, File image) async {
    final task = await FirebaseStorage.instance.ref(name).putFile(image);
    return task.ref.getDownloadURL();
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      _firestore.doc(id).delete();
    } on Exception catch (e) {
      throw Failure(message: 'Could not delete category', exception: e);
    }
  }

  @override
  Future<void> deleteCategoryImage(String imagePath) async {
    try {
      await FirebaseStorage.instance.ref(imagePath).delete();
    } on Exception catch (e) {
      throw Failure(message: 'Could not delete image', exception: e);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getCategories() {
    try {
      return _firestore.snapshots().asyncMap(
            (event) => event.docs.map(
              (e) {
                final doc = e.data();
                doc['id'] = e.id;
                return doc;
              },
            ).toList(),
          );
    } on Exception catch (e) {
      throw Failure(message: 'Could get categories', exception: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCategoriesOrderedByName() async {
    try {
      final result = await _firestore.orderBy('name').get();
      return result.docs.map((e) {
        final doc = e.data();
        doc['id'] = e.id;
        return doc;
      }).toList();
    } on Exception catch (e) {
      throw Failure(message: 'Could get categories', exception: e);
    }
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => FirebaseCategoryRepository(),
);
