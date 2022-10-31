import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../core/constants/local_files.dart';
import 'error.dart';
import 'home.dart';

class AuthGate extends StatelessWidget {
  static const route = 'auth-gate';
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(errorMsg: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseUIActions(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          // if (!state.user!.emailVerified) {
          //   Navigator.pushNamed(context, '/verify-email');
          // } else {
          Navigator.pushReplacementNamed(context, HomeScreen.route);
          // }
        }),
      ],
      child: SignInScreen(
        headerBuilder: (context, constraints, _) => AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: const AssetImage(assetLogo),
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
