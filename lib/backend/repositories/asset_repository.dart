import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/asset/asset.dart';

abstract class AssetRepository {
  Stream<List<Map<String, dynamic>>> getAssets();
  Stream<List<Map<String, dynamic>>> getAssetsByCategory(String categoryId);
  Stream<List<Map<String, dynamic>>> getAssetsOrderedByName();
  Future<void> deleteAsset(String id);
  Future<String> createAsset(Asset asset);
  Future<String> getImageUrl(String path);
  Future<String> uploadImage(String name, File image);
  Future<void> deleteAssetImage(String imagePath);
}

class FirebaseAssetRepository implements AssetRepository {
  final _ref = assetsRF.withConverter<Asset>(
    fromFirestore: (snapshot, _) => Asset.fromJson(snapshot.data()!),
    toFirestore: (asset, _) => asset.toJson(),
  );

  @override
  Future<String> createAsset(Asset asset) async {
    try {
      final res = await _ref.add(asset);
      return res.id;
    } on Exception catch (e) {
      throw Failure(
          message: S.current.msgSuccessCreateObject(asset.name), exception: e);
    }
  }

  @override
  Future<void> deleteAsset(String id) {
    // TODO: implement deleteAsset
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAssetImage(String imagePath) {
    // TODO: implement deleteAssetImage
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> getAssets() {
    try {
      return assetsRF.snapshots().asyncMap(
            (event) => event.docs.map(
              (e) {
                final doc = e.data();
                doc['id'] = e.id;
                return doc;
              },
            ).toList(),
          );
    } on Exception catch (e) {
      throw Failure(message: 'Could get assets', exception: e);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getAssetsOrderedByName() {
    try {
      return assetsRF.orderBy('name').snapshots().asyncMap(
            (event) => event.docs.map(
              (e) {
                final doc = e.data();
                doc['id'] = e.id;
                return doc;
              },
            ).toList(),
          );
    } on Exception catch (e) {
      throw Failure(message: 'Could get assets', exception: e);
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
  Stream<List<Map<String, dynamic>>> getAssetsByCategory(String categoryId) {
    try {
      return assetsRF
          .where('categoryId', isEqualTo: categoryId)
          .snapshots()
          .asyncMap(
            (event) => event.docs.map(
              (e) {
                final doc = e.data();
                doc['id'] = e.id;
                return doc;
              },
            ).toList(),
          );
    } on Exception catch (e) {
      throw Failure(message: 'Could get assets', exception: e);
    }
  }
}

final assetRepositoryProvider = Provider<AssetRepository>(
  (ref) => FirebaseAssetRepository(),
);
