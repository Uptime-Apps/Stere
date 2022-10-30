import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fuiAuth;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stere/core/constants/local_files.dart';
import 'package:stere/generated/l10n.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  fuiAuth.FirebaseUIAuth.configureProviders([
    fuiAuth.EmailAuthProvider(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => S.of(context).appName,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fuiAuth.FirebaseUIActions(
        actions: [
          fuiAuth.AuthStateChangeAction<fuiAuth.SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              Navigator.pushNamed(context, '/verify-email');
            } else {
              Navigator.pushReplacementNamed(context, '/profile');
            }
          }),
        ],
        child: fuiAuth.SignInScreen(
          headerBuilder: (context, constraints, _) => AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: const AssetImage(assetLogo),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
