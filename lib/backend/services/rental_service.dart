import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../firebase_references.dart';
import '../models/rental/rental.dart';
import '../models/status/rental_status.dart';
import '../repositories/rental_repository.dart';
import 'asset_service.dart';

abstract class RentalService {
  Future<String?> create(Rental object);
  void update(Rental object);
  void delete(Rental object);
  Future<List<Rental>?> getAll();
  Future<List<Rental>?> getActive();
  Stream<List<Rental>>? getOrderedByDate();
  void cancel(Rental object);
}

class FirebaseRentalService implements RentalService {
  FirebaseRentalService(this._repository, this._assetService);
  final RentalRepository _repository;
  final AssetService _assetService;
  final String logName = '$rentalsFB.service';

  @override
  Future<String?> create(Rental object) async {
    final newId = await _repository.create(object).then((rentalId) {
      for (var asset in object.assets) {
        _assetService.setStatus(asset.id, AssetStatus.rented);
      }
      return rentalId;
    }).onError((error, stackTrace) {
      log('failed to create',
          error: error, stackTrace: stackTrace, name: logName);
      return null;
    });
    return newId;
  }

  @override
  void update(Rental object) {
    // TODO: implement update
  }

  @override
  void delete(Rental asset) {
    // TODO: implement deleteAsset
    throw UnimplementedError();
  }

  Future<List<Rental>> mapRentals(
      Future<List<Map<String, dynamic>>> documents) async {
    var objects = await documents;
    return objects.map((e) => Rental.fromJson(e)).toList();
  }

  Stream<List<Rental>>? mapRentalsToStream(
      Stream<List<Map<String, dynamic>>> documents) {
    return documents
        .map((event) => event.map((e) => Rental.fromJson(e)).toList());
  }

  @override
  Future<List<Rental>?> getAll() {
    return mapRentals(_repository.getAll()).onError((error, stackTrace) {
      log('failed to get rentals',
          stackTrace: stackTrace, error: error, name: logName);
      return [];
    });
  }

  @override
  Future<List<Rental>?> getActive() {
    return mapRentals(_repository.getActive()).onError((error, stackTrace) {
      log('failed to get active rentals',
          stackTrace: stackTrace, error: error, name: logName);
      return [];
    });
  }

  @override
  void cancel(Rental object) {
    _repository.setStatus(object.id!, RentalStatus.canceled);
    for (var asset in object.assets) {
      _assetService.setStatus(asset.id, AssetStatus.available);
    }
  }

  @override
  Stream<List<Rental>>? getOrderedByDate() {
    try {
      return mapRentalsToStream(_repository.getOrderedByDate(true));
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }
}

final rentalServiceProvider = Provider<RentalService>((ref) {
  final rentalRepository = ref.watch(rentalRepositoryProvider);
  final assetService = ref.watch(assetServiceProvider);
  return FirebaseRentalService(rentalRepository, assetService);
});
