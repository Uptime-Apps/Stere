import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'l10n/generated/l10n.dart';
import 'routes/routes.dart';
import 'views/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((_) => runApp(const ProviderScope(child: StereApp())));
}

class StereApp extends StatelessWidget {
  const StereApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme(context);
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) => MaterialApp(
        onGenerateTitle: (context) => S.of(context).appName,
        theme: appTheme.light(lightColorScheme),
        onGenerateRoute: RouteGenerator.generate,
        initialRoute: AuthGate.route,
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

class AppTheme {
  AppTheme(BuildContext context) {
    theme = Theme.of(context);
  }
  late ThemeData theme;
  ThemeData light(ColorScheme? colorScheme) {
    ColorScheme scheme =
        colorScheme ?? ColorScheme.fromSeed(seedColor: const Color(0x004B6674));
    return theme.copyWith(
      useMaterial3: true,
      colorScheme: scheme,
    );
  }

  // ThemeData dark(ColorScheme? colorScheme) {
  //   ColorScheme scheme =
  //       colorScheme ?? ColorScheme.fromSeed(seedColor: const Color(0x00468189));
  //   return theme.copyWith(
  //     colorScheme: scheme,
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       scrolledUnderElevation: 2,
  //       foregroundColor: scheme.onSurface,
  //       backgroundColor: scheme.surface,
  //     ),
  //   );
  // }
}
