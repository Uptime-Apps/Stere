import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../backend/models/asset/asset.dart';
import '../backend/models/category/category.dart';
import '../core/components/navigation/main_scaffold.dart';
import '../core/components/others/basic_scaffold.dart';
import '../core/components/others/filled_button.dart';
import '../core/components/others/utilities.dart';
import '../l10n/generated/l10n.dart';
import '../views/assets/detail.dart';
import '../views/assets/form/asset_form.dart';
import '../views/authentication.dart';
import '../views/categories/detail/detail.dart';
import '../views/categories/form/category_form.dart';
import '../views/error.dart';
import '../views/rentals/form/rental_form.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          return StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data!.emailVerified) {
                  return const StereMainScreenScaffold();
                } else {
                  return const StereVerifyEmailScreen();
                }
              }
              return const AuthGate();
            },
            stream: FirebaseAuth.instance.authStateChanges(),
          );
        });
      case StereVerifyEmailScreen.route:
        return MaterialPageRoute(
            builder: (context) => const StereVerifyEmailScreen());
      case RentalForm.route:
        return MaterialPageRoute(builder: (context) => const RentalForm());
      case AssetForm.route:
        return MaterialPageRoute(builder: (context) => const AssetForm());
      case CategoryForm.route:
        return MaterialPageRoute(builder: (context) => const CategoryForm());
      case AssetDetailScreen.route:
        final asset = settings.arguments as Asset;
        return MaterialPageRoute(
            builder: (context) => AssetDetailScreen(asset));
      case CategoryDetailScreen.route:
        final obj = settings.arguments as Category;
        return MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(obj));
      default:
        return MaterialPageRoute(
            builder: (context) =>
                ErrorScreen(errorMsg: S.of(context).emPageNotFound));
    }
  }
}

class StereVerifyEmailScreen extends StatefulWidget {
  static const route = 'verify-email';
  const StereVerifyEmailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StereVerifyEmailScreen> createState() => _StereVerifyEmailScreenState();
}

class _StereVerifyEmailScreenState extends State<StereVerifyEmailScreen> {
  bool _emailSent = false;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StereBasicScaffold(
      title: S.of(context).stVerifyEmail,
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            const Spacer(flex: 1),
            Icon(Icons.email,
                size: MediaQuery.of(context).size.width / 2.5,
                color: Theme.of(context).colorScheme.tertiary),
            const DefaultSpacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                S.of(context).msgVerifyEmail(user.email!),
                textAlign: TextAlign.center,
              ),
            ),
            const DefaultSpacer(),
            (!_emailSent)
                ? FilledButton(
                    label: Text(S.of(context).lblSend),
                    onPressed: () {
                      user.sendEmailVerification();
                      setState(() {
                        _emailSent = true;
                      });
                    })
                : FilledButton(
                    label: Text(S.of(context).lblDone),
                    onPressed: () async {
                      FirebaseAuth.instance.signOut();
                    }),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
