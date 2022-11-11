import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../firebase_references.dart';
import '../models/asset/asset.dart';
import '../repositories/asset_repository.dart';

abstract class AssetService {
  Stream<List<Asset>>? getAssets();
  Stream<List<Asset>>? getAssetsByCategory(String id);
  Stream<List<Asset>>? getAssetsOrderedByName();
  Future<String?> getImageUrl(Asset asset);
  Future<String?> createAsset(Asset asset, File? image);
  Future<String?> deleteAsset(Asset asset);
}

class FirebaseAssetService implements AssetService {
  FirebaseAssetService(this._assetRepository);
  final AssetRepository _assetRepository;
  final String logName = '$assetsFB.service';

  @override
  Future<String?> createAsset(Asset asset, File? image) async {
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
    final newId = await _assetRepository.createAsset(asset);
    return newId;
  }

  @override
  Future<String?> deleteAsset(Asset asset) {
    // TODO: implement deleteAsset
    throw UnimplementedError();
  }

  Stream<List<Asset>>? mapAssets(Stream<List<Map<String, dynamic>>> documents) {
    return documents
        .map((event) => event.map((e) => Asset.fromJson(e)).toList());
  }

  @override
  Stream<List<Asset>>? getAssets() {
    try {
      return mapAssets(_assetRepository.getAssets());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Stream<List<Asset>>? getAssetsOrderedByName() {
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
  Stream<List<Asset>>? getAssetsByCategory(String categoryId) {
    try {
      mapAssets(_assetRepository.getAssetsByCategory(categoryId));
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
