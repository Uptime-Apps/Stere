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

  /// `This field is required`
  String get emFieldRequired {
    return Intl.message(
      'This field is required',
      name: 'emFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `A tag is required`
  String get emTagRequired {
    return Intl.message(
      'A tag is required',
      name: 'emTagRequired',
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

  /// `No {object} Registered`
  String emNoObjectsRegistered(Object object) {
    return Intl.message(
      'No $object Registered',
      name: 'emNoObjectsRegistered',
      desc: '',
      args: [object],
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

  /// `Home`
  String get lblHome {
    return Intl.message(
      'Home',
      name: 'lblHome',
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

  /// `Price`
  String get ilPrice {
    return Intl.message(
      'Price',
      name: 'ilPrice',
      desc: '',
      args: [],
    );
  }

  /// `The price must be greater than 0`
  String get emInvalidPrice {
    return Intl.message(
      'The price must be greater than 0',
      name: 'emInvalidPrice',
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

  /// `Name`
  String get lblName {
    return Intl.message(
      'Name',
      name: 'lblName',
      desc: '',
      args: [],
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

  /// `Settings`
  String get lblSettings {
    return Intl.message(
      'Settings',
      name: 'lblSettings',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get lblSave {
    return Intl.message(
      'Save',
      name: 'lblSave',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get lblTags {
    return Intl.message(
      'Tags',
      name: 'lblTags',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get msgAreYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'msgAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Click if the category contains automotive items`
  String get msgAutomotive {
    return Intl.message(
      'Click if the category contains automotive items',
      name: 'msgAutomotive',
      desc: '',
      args: [],
    );
  }

  /// `To select a tag, pick a category`
  String get msgMissingCategory {
    return Intl.message(
      'To select a tag, pick a category',
      name: 'msgMissingCategory',
      desc: '',
      args: [],
    );
  }

  /// `You have no {itemLabel} registered`
  String msgNoRegisters(Object itemLabel) {
    return Intl.message(
      'You have no $itemLabel registered',
      name: 'msgNoRegisters',
      desc: '',
      args: [itemLabel],
    );
  }

  /// `Page not found`
  String get msgPageNotFound {
    return Intl.message(
      'Page not found',
      name: 'msgPageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get msgRegisteredSuccessfully {
    return Intl.message(
      'Registered successfully',
      name: 'msgRegisteredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Stere`
  String get msgWelcome {
    return Intl.message(
      'Welcome to Stere',
      name: 'msgWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Before you begin, please verify your account. Send verification email to {email}`
  String msgVerifyEmail(Object email) {
    return Intl.message(
      'Before you begin, please verify your account. Send verification email to $email',
      name: 'msgVerifyEmail',
      desc: '',
      args: [email],
    );
  }

  /// `Delete`
  String get lblDelete {
    return Intl.message(
      'Delete',
      name: 'lblDelete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get lblEdit {
    return Intl.message(
      'Edit',
      name: 'lblEdit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get lblCancel {
    return Intl.message(
      'Cancel',
      name: 'lblCancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get lblConfirm {
    return Intl.message(
      'Confirm',
      name: 'lblConfirm',
      desc: '',
      args: [],
    );
  }

  /// `This will delete the category and all its assets. You won't be able to undo this action.`
  String get msgWarningDeleteCategory {
    return Intl.message(
      'This will delete the category and all its assets. You won\'t be able to undo this action.',
      name: 'msgWarningDeleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete "{object}"`
  String msgFailedDeleteObject(Object object) {
    return Intl.message(
      'Failed to delete "$object"',
      name: 'msgFailedDeleteObject',
      desc: '',
      args: [object],
    );
  }

  /// `Failed to create "{object}"`
  String msgFailedCreateObject(Object object) {
    return Intl.message(
      'Failed to create "$object"',
      name: 'msgFailedCreateObject',
      desc: '',
      args: [object],
    );
  }

  /// `Deleted "{object}" successfully`
  String msgSuccessDeleteObject(Object object) {
    return Intl.message(
      'Deleted "$object" successfully',
      name: 'msgSuccessDeleteObject',
      desc: '',
      args: [object],
    );
  }

  /// `Created "{object}" successfully`
  String msgSuccessCreateObject(Object object) {
    return Intl.message(
      'Created "$object" successfully',
      name: 'msgSuccessCreateObject',
      desc: '',
      args: [object],
    );
  }

  /// `Done`
  String get lblDone {
    return Intl.message(
      'Done',
      name: 'lblDone',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get lblSend {
    return Intl.message(
      'Send',
      name: 'lblSend',
      desc: '',
      args: [],
    );
  }

  /// `You have information in the form, are you sure you want to discard your changes?`
  String get msgYouHaveInformation {
    return Intl.message(
      'You have information in the form, are you sure you want to discard your changes?',
      name: 'msgYouHaveInformation',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while creating {itemName}`
  String resultCreateFailure(Object itemName) {
    return Intl.message(
      'An error occurred while creating $itemName',
      name: 'resultCreateFailure',
      desc: '',
      args: [itemName],
    );
  }

  /// `{itemName} was created`
  String resultCreateSuccess(Object itemName) {
    return Intl.message(
      '$itemName was created',
      name: 'resultCreateSuccess',
      desc: '',
      args: [itemName],
    );
  }

  /// `All data from category {itemName} was removed`
  String resultDeleteSuccess(Object itemName) {
    return Intl.message(
      'All data from category $itemName was removed',
      name: 'resultDeleteSuccess',
      desc: '',
      args: [itemName],
    );
  }

  /// `Active Rentals`
  String get stActiveRentals {
    return Intl.message(
      'Active Rentals',
      name: 'stActiveRentals',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get stVerifyEmail {
    return Intl.message(
      'Verify Email',
      name: 'stVerifyEmail',
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
