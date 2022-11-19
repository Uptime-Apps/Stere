import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/asset/asset.dart';
import '../models/status/rental_status.dart';

abstract class AssetRepository {
  Future<List<Map<String, dynamic>>> getAssets();
  Future<List<Map<String, dynamic>>> getAssetsByCategory(String categoryId);
  Future<List<Map<String, dynamic>>> getAssetsOrderedByName();
  Future<void> delete(String id);
  Future<String> create(Asset asset);
  Future<String> getImageUrl(String path);
  Future<String> uploadImage(String name, File image);
  Future<void> deleteImage(String imagePath);
  Future<void> setStatus(String id, AssetStatus status);
}

class FirebaseAssetRepository implements AssetRepository {
  final _ref = assetsRF.withConverter<Asset>(
    fromFirestore: (snapshot, _) => Asset.fromJson(snapshot.data()!),
    toFirestore: (asset, _) => asset.toJson(),
  );
  final String logName = 'firebase-asset-repository';

  @override
  Future<String> create(Asset asset) async {
    try {
      final res = await _ref.add(asset);
      return res.id;
    } on Exception catch (e) {
      throw Failure(
          message: S.current.msgSuccessCreateObject(asset.name), exception: e);
    }
  }

  @override
  Future<void> delete(String id) {
    return assetsRF.doc(id).delete();
  }

  @override
  Future<void> deleteImage(String imagePath) {
    try {
      return FirebaseStorage.instance.ref('$assetsFB/$imagePath').delete();
    } on Exception catch (e) {
      throw Failure(message: 'Could not delete image', exception: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAssets() async {
    try {
      var res = await assetsRF.get();
      return res.docs.map(
        (e) {
          final doc = e.data();
          doc['id'] = e.id;
          return doc;
        },
      ).toList();
    } on Exception catch (e) {
      throw Failure(message: 'Could get assets', exception: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAssetsOrderedByName() async {
    try {
      var res = await assetsRF.orderBy('name').get();
      return res.docs.map((e) {
        final doc = e.data();
        doc['id'] = e.id;
        return doc;
      }).toList();
    } on Exception catch (e) {
      throw Failure(message: 'Could get assets', exception: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAssetsByCategory(
      String categoryId) async {
    try {
      var res = await assetsRF.where('categoryId', isEqualTo: categoryId).get();
      return res.docs.map((e) {
        final doc = e.data();
        doc['id'] = e.id;
        return doc;
      }).toList();
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
  Future<void> setStatus(String id, AssetStatus status) async {
    try {
      log('Updated status to ${status.name}', name: logName);
      return assetsRF.doc(id).update({'status': status.name});
    } on Exception catch (e) {
      log('Failed to Updated status of $id', name: logName);
      throw Failure(message: 'Could get assets', exception: e);
    }
  }
}

final assetRepositoryProvider = Provider<AssetRepository>(
  (ref) => FirebaseAssetRepository(),
);
