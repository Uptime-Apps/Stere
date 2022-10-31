import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';
import '../views/authentication.dart';
import '../views/error.dart';
import '../views/home.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          if (FirebaseAuth.instance.currentUser != null) {
            return const HomeScreen();
          }
          return const AuthGate();
        });
      default:
        return MaterialPageRoute(
            builder: (context) => ErrorScreen(errorMsg: S.of(context).appName));
    }
  }
}
