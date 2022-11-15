import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../firebase_references.dart';
import '../models/rental/rental.dart';
import '../repositories/rental_repository.dart';

abstract class RentalService {
  Future<String?> create(Rental object);
  void update(Rental object);
  void delete(Rental object);
  Stream<List<Rental>>? getAll();
  Stream<List<Rental>>? getActive();
}

class FirebaseRentalService implements RentalService {
  FirebaseRentalService(this._repository);
  final RentalRepository _repository;
  final String logName = '$rentalsFB.service';

  @override
  Future<String?> create(Rental object) async {
    final newId = await _repository.create(object);
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

  Stream<List<Rental>>? mapAssets(
      Stream<List<Map<String, dynamic>>> documents) {
    return documents
        .map((event) => event.map((e) => Rental.fromJson(e)).toList());
  }

  @override
  Stream<List<Rental>>? getAll() {
    try {
      return mapAssets(_repository.getAll());
    } on Failure catch (e) {
      log(e.message, name: logName);
    }
    return null;
  }

  @override
  Stream<List<Rental>>? getActive() {
    // TODO: implement getActive
    throw UnimplementedError();
  }
}

final rentalServiceProvider = Provider<RentalService>((ref) {
  final rentalRepository = ref.watch(rentalRepositoryProvider);
  return FirebaseRentalService(rentalRepository);
});
