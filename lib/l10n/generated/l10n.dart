// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Stere`
  String get appName {
    return Intl.message(
      'Stere',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Page Not Found`
  String get emPageNotFound {
    return Intl.message(
      'Page Not Found',
      name: 'emPageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Error [{code}]: {message}`
  String emDebug(Object code, Object message) {
    return Intl.message(
      'Error [$code]: $message',
      name: 'emDebug',
      desc: '',
      args: [code, message],
    );
  }

  /// `{isPlural, plural, one{Asset} other{Assets}}`
  String lblAssets(num isPlural) {
    return Intl.plural(
      isPlural,
      one: 'Asset',
      other: 'Assets',
      name: 'lblAssets',
      desc: '',
      args: [isPlural],
    );
  }

  /// `{isPlural, plural, one{Rental} other{Rentals}}`
  String lblRentals(num isPlural) {
    return Intl.plural(
      isPlural,
      one: 'Rental',
      other: 'Rentals',
      name: 'lblRentals',
      desc: '',
      args: [isPlural],
    );
  }

  /// `{isPlural, plural, one{Category} other{Categories}}`
  String lblCategories(num isPlural) {
    return Intl.plural(
      isPlural,
      one: 'Category',
      other: 'Categories',
      name: 'lblCategories',
      desc: '',
      args: [isPlural],
    );
  }

  /// `New {object}`
  String lblCreateObject(Object object) {
    return Intl.message(
      'New $object',
      name: 'lblCreateObject',
      desc: '',
      args: [object],
    );
  }

  /// `Settings`
  String get lblSettings {
    return Intl.message(
      'Settings',
      name: 'lblSettings',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get lblHome {
    return Intl.message(
      'Home',
      name: 'lblHome',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get lblMore {
    return Intl.message(
      'More',
      name: 'lblMore',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get lblLogout {
    return Intl.message(
      'Log out',
      name: 'lblLogout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
