import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../firebase_references.dart';
import '../models/asset/asset.dart';
import '../models/status/rental_status.dart';
import '../repositories/asset_repository.dart';

abstract class AssetService {
  Future<List<Asset>>? getAssets();
  Future<List<Asset>>? getAssetsByCategory(String id);
  Stream<List<Asset>>? getAssetsOrderedByName();
  Stream<List<Asset>>? getAvailable();
  Future<String?> getImageUrl(String? imagePath);
  Future<String?> create(Asset asset, File? image);
  void setStatus(String id, AssetStatus status);
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
  void setStatus(String id, AssetStatus status) {
    _assetRepository.setStatus(id, status);
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

  Stream<List<Asset>>? mapAssetsToStream(
      Stream<List<Map<String, dynamic>>> documents) {
    return documents
        .map((event) => event.map((e) => Asset.fromJson(e)).toList());
  }

  @override
  Future<List<Asset>>? getAssets() {
    try {
      return mapAssets(_assetRepository.getAll());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Stream<List<Asset>>? getAvailable() {
    try {
      return mapAssetsToStream(_assetRepository.getAvailable());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Stream<List<Asset>>? getAssetsOrderedByName() {
    try {
      return mapAssetsToStream(_assetRepository.getAssetsOrderedByName());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Future<String?> getImageUrl(String? imagePath) async {
    try {
      return (imagePath?.isNotEmpty ?? false)
          ? await _assetRepository.getImageUrl(imagePath!)
          : null;
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
