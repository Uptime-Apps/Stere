import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> categoriesRF =
    FirebaseFirestore.instance.collection('categories');

CollectionReference<Map<String, dynamic>> assetsRF =
    FirebaseFirestore.instance.collection('assets');

CollectionReference<Map<String, dynamic>> rentalRF =
    FirebaseFirestore.instance.collection('rentals');
