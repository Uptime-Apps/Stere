import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/components/navigation/main_scaffold.dart';
import '../l10n/generated/l10n.dart';
import '../views/assets/asset_form.dart';
import '../views/authentication.dart';
import '../views/categories/category_form.dart';
import '../views/error.dart';
import '../views/rentals/rental_form.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          return StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return const StereMainScreenScaffold();
              }
              return const AuthGate();
            },
            stream: FirebaseAuth.instance.authStateChanges(),
          );
        });
      case RentalForm.route:
        return MaterialPageRoute(builder: (context) => const RentalForm());
      case AssetForm.route:
        return MaterialPageRoute(builder: (context) => const AssetForm());
      case CategoryForm.route:
        return MaterialPageRoute(builder: (context) => const CategoryForm());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                ErrorScreen(errorMsg: S.of(context).emPageNotFound));
    }
  }
}
