import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failure.dart';
import '../../l10n/generated/l10n.dart';
import '../firebase_references.dart';
import '../models/rental/rental.dart';
import '../models/status/rental_status.dart';

abstract class RentalRepository {
  Future<List<Map<String, dynamic>>> getActive();
  Future<List<Map<String, dynamic>>> getAll();
  Future<String?> create(Rental object);
  Stream<List<Map<String, dynamic>>> getOrderedByDate(bool descending);
  void delete(String id);
  void setStatus(String id, RentalStatus status);
  void update(Rental object);
}

class FirebaseRentalRepository implements RentalRepository {
  final String logName = '$rentalsFB.repository';
  final _ref = rentalRF.withConverter<Rental>(
    fromFirestore: (snapshot, _) => Rental.fromJson(snapshot.data()!),
    toFirestore: (asset, _) => asset.toJson(),
  );

  @override
  Future<String?> create(Rental object) async {
    final String objName = S.current.lblRentals(1);
    try {
      final res = await _ref.add(object).then(
        (doc) {
          log(S.current.msgSuccessCreateObject(objName), name: logName);
          return doc;
        },
        onError: ((error, stackTrace) {
          log(
            S.current.msgFailedCreateObject(objName),
            name: logName,
            error: error,
            stackTrace: stackTrace,
          );
          return null;
        }),
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
    rentalRF
        .doc(id)
        .delete()
        .then((_) => log(S.current.msgSuccessDeleteObject(id), name: logName))
        .onError((error, stackTrace) => log(
              S.current.msgFailedDeleteObject(id),
              name: logName,
              error: error,
              stackTrace: stackTrace,
            ));
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      var objects = await rentalRF.get();
      return objects.docs.map(
        (e) {
          final doc = e.data();
          doc['id'] = e.id;
          return doc;
        },
      ).toList();
    } on Exception catch (e) {
      throw Failure(message: 'Could not get rentals', exception: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getActive() async {
    try {
      var objects = await rentalRF
          .where('status', isEqualTo: RentalStatus.active.name)
          .get();
      return objects.docs.map(
        (e) {
          final doc = e.data();
          doc['id'] = e.id;
          return doc;
        },
      ).toList();
    } on Exception catch (e) {
      throw Failure(message: 'Could not get ordered rentals', exception: e);
    }
  }

  @override
  void setStatus(String id, RentalStatus status) {
    try {
      rentalRF
          .doc(id)
          .set({'status': status.name}, SetOptions(merge: true))
          .then((_) => log(S.current.msgSuccessUpdateObject('[$id:\t$status]'),
              name: logName))
          .onError((error, stackTrace) => log(
                S.current.msgFailedUpdateObject('[$id:\t$status]'),
                name: logName,
                error: error,
                stackTrace: stackTrace,
              ));
    } on Exception catch (e) {
      throw Failure(message: S.current.msgFailedUpdateObject(id), exception: e);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getOrderedByDate(bool descending) {
    try {
      return rentalRF
          .orderBy('creationDate', descending: descending)
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
      throw Failure(message: 'Could not get rentals', exception: e);
    }
  }
}

final rentalRepositoryProvider = Provider<RentalRepository>(
  (ref) => FirebaseRentalRepository(),
);
