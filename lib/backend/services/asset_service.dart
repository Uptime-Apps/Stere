import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../firebase_references.dart';
import '../models/asset/asset.dart';
import '../repositories/asset_repository.dart';

abstract class AssetService {
  Future<List<Asset>>? getAssets();
  Future<List<Asset>>? getAssetsByCategory(String id);
  Future<List<Asset>>? getAssetsOrderedByName();
  Future<String?> getImageUrl(Asset asset);
  Future<String?> create(Asset asset, File? image);
  Future<void> delete(Asset asset);
}

class FirebaseAssetService implements AssetService {
  FirebaseAssetService(this._assetRepository);
  final AssetRepository _assetRepository;
  final String logName = '$assetsFB.service';

  @override
  Future<String?> create(Asset asset, File? image) async {
    if (image != null) {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final extension = image.path.split('.').last;
      final fileName = asset.name.toLowerCase().replaceAll(' ', '_');
      final imagePath = '$assetsFB/${uid}_$fileName.$extension';
      await _assetRepository.uploadImage(
        imagePath,
        image,
      );
      asset = asset.copyWith(imagePath: imagePath);
    }
    final newId = await _assetRepository.create(asset);
    return newId;
  }

  @override
  Future<void> delete(Asset asset) async {
    final id = asset.id!;
    // delete image
    if (asset.imagePath != null) {
      final imagePath =
          Uri.decodeFull(asset.imagePath!.split('?').first.split('/').last);
      await _assetRepository.deleteImage(imagePath).whenComplete(() => log(
          'Deleted image successfuly: ${asset.imagePath}',
          name: logName,
          level: 1));
    }
    return _assetRepository.delete(id);
  }

  Future<List<Asset>> mapAssets(
      Future<List<Map<String, dynamic>>> documents) async {
    var docs = await documents;
    return docs.map((e) => Asset.fromJson(e)).toList();
  }

  @override
  Future<List<Asset>>? getAssets() {
    try {
      return mapAssets(_assetRepository.getAssets());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Future<List<Asset>>? getAssetsOrderedByName() {
    try {
      return mapAssets(_assetRepository.getAssetsOrderedByName());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Future<String?> getImageUrl(Asset asset) async {
    try {
      if (asset.imagePath != null) {
        return await _assetRepository.getImageUrl(asset.imagePath!);
      }
    } on Failure catch (e) {
      log(e.message, name: logName);
    } on FirebaseException catch (e) {
      log('Failed to load image\n${e.message}', name: logName);
    }
    return null;
  }

  @override
  Future<List<Asset>>? getAssetsByCategory(String categoryId) {
    try {
      return mapAssets(_assetRepository.getAssetsByCategory(categoryId));
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }
}

final assetServiceProvider = Provider<AssetService>((ref) {
  final assetRepository = ref.watch(assetRepositoryProvider);
  return FirebaseAssetService(assetRepository);
});
