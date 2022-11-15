import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/rental/rental.dart';
import '../models/status/rental_status.dart';

abstract class RentalRepository {
  Stream<List<Map<String, dynamic>>> getAll();
  Stream<List<Map<String, dynamic>>> getActive();
  void delete(String id);
  Future<String> create(Rental object);
  void update(Rental object);
}

class FirebaseRentalRepository implements RentalRepository {
  final String logName = '$rentalsFB.repository';
  final _ref = rentalRF.withConverter<Rental>(
    fromFirestore: (snapshot, _) => Rental.fromJson(snapshot.data()!),
    toFirestore: (asset, _) => asset.toJson(),
  );

  @override
  Future<String> create(Rental object) async {
    final String objName = S.current.lblRentals(1);
    try {
      final res = await _ref.add(object).then(
        (doc) {
          log(S.current.msgSuccessCreateObject(objName), name: logName);
          return doc;
        },
        onError: ((error, stackTrace) => log(
              S.current.msgFailedCreateObject(objName),
              name: logName,
              error: error,
              stackTrace: stackTrace,
            )),
      );
      return res.id;
    } on Exception catch (e) {
      throw Failure(
          message: S.current.msgFailedCreateObject(objName), exception: e);
    }
  }

  @override
  void update(Rental object) {
    final objName = S.current.lblRentals(1);
    try {
      _ref
          .doc(object.id)
          .set(object, SetOptions(merge: true))
          .then((_) =>
              log(S.current.msgSuccessUpdateObject(objName), name: logName))
          .onError((error, stackTrace) => log(
                S.current.msgFailedUpdateObject(objName),
                name: logName,
                error: error,
                stackTrace: stackTrace,
              ));
    } on Exception catch (e) {
      throw Failure(
          message: S.current.msgFailedUpdateObject(objName), exception: e);
    }
  }

  @override
  void delete(String id) {
    // TODO: implement deleteAsset
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> getAll() {
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
      throw Failure(message: 'Could get rentals', exception: e);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getActive() {
    try {
      return assetsRF
          .where('status', isEqualTo: RentalStatus.active)
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
      throw Failure(message: 'Could get ordered rentals', exception: e);
    }
  }
}

final rentalRepositoryProvider = Provider<RentalRepository>(
  (ref) => FirebaseRentalRepository(),
);