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

  /// `Error [{code}]: {message}`
  String emDebug(Object code, Object message) {
    return Intl.message(
      'Error [$code]: $message',
      name: 'emDebug',
      desc: '',
      args: [code, message],
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

  /// `The price must be greater than 0`
  String get emInvalidPrice {
    return Intl.message(
      'The price must be greater than 0',
      name: 'emInvalidPrice',
      desc: '',
      args: [],
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

  /// `There was an error in the server`
  String get emServerError {
    return Intl.message(
      'There was an error in the server',
      name: 'emServerError',
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

  /// `Hotel, AirBnB, family member...`
  String get exClientBackupPhone {
    return Intl.message(
      'Hotel, AirBnB, family member...',
      name: 'exClientBackupPhone',
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

  /// `Cancel`
  String get lblCancel {
    return Intl.message(
      'Cancel',
      name: 'lblCancel',
      desc: '',
      args: [],
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

  /// `Backup Phone`
  String get lblClientBackupPhone {
    return Intl.message(
      'Backup Phone',
      name: 'lblClientBackupPhone',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get lblClientDeposit {
    return Intl.message(
      'Deposit',
      name: 'lblClientDeposit',
      desc: '',
      args: [],
    );
  }

  /// `Identification`
  String get lblClientDepositIdentification {
    return Intl.message(
      'Identification',
      name: 'lblClientDepositIdentification',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get lblClientDepositPassport {
    return Intl.message(
      'Passport',
      name: 'lblClientDepositPassport',
      desc: '',
      args: [],
    );
  }

  /// `Housing`
  String get lblClientHousing {
    return Intl.message(
      'Housing',
      name: 'lblClientHousing',
      desc: '',
      args: [],
    );
  }

  /// `Identification number`
  String get lblClientId {
    return Intl.message(
      'Identification number',
      name: 'lblClientId',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get lblClientName {
    return Intl.message(
      'Name',
      name: 'lblClientName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get lblClientPhone {
    return Intl.message(
      'Phone',
      name: 'lblClientPhone',
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

  /// `Create one!`
  String get lblCreateNew {
    return Intl.message(
      'Create one!',
      name: 'lblCreateNew',
      desc: '',
      args: [],
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

  /// `Damage Report`
  String get lblDamageReport {
    return Intl.message(
      'Damage Report',
      name: 'lblDamageReport',
      desc: '',
      args: [],
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

  /// `Done`
  String get lblDone {
    return Intl.message(
      'Done',
      name: 'lblDone',
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

  /// `Final Mileage`
  String get lblFinalMileage {
    return Intl.message(
      'Final Mileage',
      name: 'lblFinalMileage',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get lblHistory {
    return Intl.message(
      'History',
      name: 'lblHistory',
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

  /// `{hours, plural, one{1 hour} other{{hours} hours}}`
  String lblHours(num hours) {
    return Intl.plural(
      hours,
      one: '1 hour',
      other: '$hours hours',
      name: 'lblHours',
      desc: '',
      args: [hours],
    );
  }

  /// `Initial Mileage`
  String get lblInitialMileage {
    return Intl.message(
      'Initial Mileage',
      name: 'lblInitialMileage',
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

  /// `No`
  String get lblNo {
    return Intl.message(
      'No',
      name: 'lblNo',
      desc: '',
      args: [],
    );
  }

  /// `{price}`
  String priceFormat(double price) {
    final NumberFormat priceNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(), symbol: '₡', decimalDigits: 2);
    final String priceString = priceNumberFormat.format(price);

    return Intl.message(
      '$priceString',
      name: 'priceFormat',
      desc: '',
      args: [priceString],
    );
  }

  /// `Notes`
  String get lblNotesReport {
    return Intl.message(
      'Notes',
      name: 'lblNotesReport',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get lblNotifications {
    return Intl.message(
      'Notifications',
      name: 'lblNotifications',
      desc: '',
      args: [],
    );
  }

  /// `{object} Available: {count}`
  String lblAvailableCount(Object object, Object count) {
    return Intl.message(
      '$object Available: $count',
      name: 'lblAvailableCount',
      desc: '',
      args: [object, count],
    );
  }

  /// `Selected Assets`
  String get lblSelectedAssets {
    return Intl.message(
      'Selected Assets',
      name: 'lblSelectedAssets',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get lblPrice {
    return Intl.message(
      'Price',
      name: 'lblPrice',
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

  /// `Save`
  String get lblSave {
    return Intl.message(
      'Save',
      name: 'lblSave',
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

  /// `Settings`
  String get lblSettings {
    return Intl.message(
      'Settings',
      name: 'lblSettings',
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

  /// `Yes`
  String get lblYes {
    return Intl.message(
      'Yes',
      name: 'lblYes',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete`
  String get ttIncomplete {
    return Intl.message(
      'Incomplete',
      name: 'ttIncomplete',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get ttReady {
    return Intl.message(
      'Ready',
      name: 'ttReady',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get ttUndefined {
    return Intl.message(
      'Undefined',
      name: 'ttUndefined',
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

  /// `No {objects} available`
  String msgNothingAvailable(Object objects) {
    return Intl.message(
      'No $objects available',
      name: 'msgNothingAvailable',
      desc: '',
      args: [objects],
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

  /// `Failed to create "{object}"`
  String msgFailedCreateObject(Object object) {
    return Intl.message(
      'Failed to create "$object"',
      name: 'msgFailedCreateObject',
      desc: '',
      args: [object],
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

  /// `Failed to update "{object}"`
  String msgFailedUpdateObject(Object object) {
    return Intl.message(
      'Failed to update "$object"',
      name: 'msgFailedUpdateObject',
      desc: '',
      args: [object],
    );
  }

  /// `{status, select, false{The form is missing information or has invalid data} other{The form's information is valid}}`
  String msgFormStatus(Object status) {
    return Intl.select(
      status,
      {
        'false': 'The form is missing information or has invalid data',
        'other': 'The form\'s information is valid',
      },
      name: 'msgFormStatus',
      desc: '',
      args: [status],
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

  /// `Nothing to see here`
  String get msgNothingToSee {
    return Intl.message(
      'Nothing to see here',
      name: 'msgNothingToSee',
      desc: '',
      args: [],
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

  /// `Created "{object}" successfully`
  String msgSuccessCreateObject(Object object) {
    return Intl.message(
      'Created "$object" successfully',
      name: 'msgSuccessCreateObject',
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

  /// `Updated "{object}" successfully`
  String msgSuccessUpdateObject(Object object) {
    return Intl.message(
      'Updated "$object" successfully',
      name: 'msgSuccessUpdateObject',
      desc: '',
      args: [object],
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

  /// `This will delete the category and all its assets. You won't be able to undo this action.`
  String get msgWarningDeleteCategory {
    return Intl.message(
      'This will delete the category and all its assets. You won\'t be able to undo this action.',
      name: 'msgWarningDeleteCategory',
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

  /// `You have information in the form, are you sure you want to discard your changes?`
  String get msgYouHaveInformation {
    return Intl.message(
      'You have information in the form, are you sure you want to discard your changes?',
      name: 'msgYouHaveInformation',
      desc: '',
      args: [],
    );
  }

  /// `Identification`
  String get optIdentification {
    return Intl.message(
      'Identification',
      name: 'optIdentification',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get optPassport {
    return Intl.message(
      'Passport',
      name: 'optPassport',
      desc: '',
      args: [],
    );
  }

  /// `No information`
  String get msgNoInformation {
    return Intl.message(
      'No information',
      name: 'msgNoInformation',
      desc: '',
      args: [],
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

  /// `What to do with selected assets?`
  String get stInformationDialogNewRental {
    return Intl.message(
      'What to do with selected assets?',
      name: 'stInformationDialogNewRental',
      desc: '',
      args: [],
    );
  }

  /// `Delete them by swiping one of your selected assets to the left`
  String get stInformationDialogNewRentalDelete {
    return Intl.message(
      'Delete them by swiping one of your selected assets to the left',
      name: 'stInformationDialogNewRentalDelete',
      desc: '',
      args: [],
    );
  }

  /// `Edit them by swiping one of your selected assets to the right`
  String get stInformationDialogNewRentalEdit {
    return Intl.message(
      'Edit them by swiping one of your selected assets to the right',
      name: 'stInformationDialogNewRentalEdit',
      desc: '',
      args: [],
    );
  }

  /// `Available Assets`
  String get stepAvailableAssets {
    return Intl.message(
      'Available Assets',
      name: 'stepAvailableAssets',
      desc: '',
      args: [],
    );
  }

  /// `Customer Information`
  String get stepClientInformation {
    return Intl.message(
      'Customer Information',
      name: 'stepClientInformation',
      desc: '',
      args: [],
    );
  }

  /// `Final Review`
  String get stepFinalReview {
    return Intl.message(
      'Final Review',
      name: 'stepFinalReview',
      desc: '',
      args: [],
    );
  }

  /// `Rental Information`
  String get stepRentalInformation {
    return Intl.message(
      'Rental Information',
      name: 'stepRentalInformation',
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
