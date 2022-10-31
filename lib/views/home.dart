import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/components/navigation/scaffold.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser?.uid ?? 'loading';
    return StereScaffold(
      body: Text(name),
    );
  }
}
