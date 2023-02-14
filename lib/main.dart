import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/radius_values.dart';
import 'firebase_options.dart';
import 'l10n/generated/l10n.dart';
import 'routes/routes.dart';

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
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme(context);
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) => MaterialApp(
        navigatorKey: navKey,
        onGenerateTitle: (context) => S.of(context).appName,
        theme: appTheme.light(lightColorScheme),
        // darkTheme: appTheme.dark(darkColorScheme),
        onGenerateRoute: RouteGenerator.generate,
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
        colorScheme ?? ColorScheme.fromSeed(seedColor: Colors.teal);
    return theme.copyWith(
      useMaterial3: true,
      colorScheme: scheme,
      chipTheme: theme.chipTheme.copyWith(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kChipRadius),
          side: BorderSide(color: scheme.outline),
        ),
        labelStyle:
            TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w500),
      ),
      dividerTheme: const DividerThemeData(thickness: 1, space: 0),
      tabBarTheme: TabBarTheme(
        labelColor: scheme.primary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: scheme.primary),
        ),
      ),
    );
  }
}
