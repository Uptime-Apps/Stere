import 'package:cloud_firestore/cloud_firestore.dart';

const String categoriesFB = 'categories';

CollectionReference<Map<String, dynamic>> categoriesRF =
    FirebaseFirestore.instance.collection(categoriesFB);

const String assetsFB = 'assets';
CollectionReference<Map<String, dynamic>> assetsRF =
    FirebaseFirestore.instance.collection(assetsFB);

const String rentalsFB = 'rentals';
CollectionReference<Map<String, dynamic>> rentalRF =
    FirebaseFirestore.instance.collection(rentalsFB);
