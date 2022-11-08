// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(code, message) => "Error [${code}]: ${message}";

  static String m1(object) => "No ${object} Registered";

  static String m2(isPlural) =>
      "${Intl.plural(isPlural, one: 'Asset', other: 'Assets')}";

  static String m3(isPlural) =>
      "${Intl.plural(isPlural, one: 'Category', other: 'Categories')}";

  static String m4(object) => "New ${object}";

  static String m5(isPlural) =>
      "${Intl.plural(isPlural, one: 'Rental', other: 'Rentals')}";

  static String m6(object) => "Failed to create \"${object}\"";

  static String m7(object) => "Failed to delete \"${object}\"";

  static String m8(itemLabel) => "You have no ${itemLabel} registered";

  static String m9(object) => "Created \"${object}\" successfully";

  static String m10(object) => "Deleted \"${object}\" successfully";

  static String m11(email) =>
      "Before you begin, please verify your account. Send verification email to ${email}";

  static String m12(itemName) => "An error occurred while creating ${itemName}";

  static String m13(itemName) => "${itemName} was created";

  static String m14(itemName) =>
      "All data from category ${itemName} was removed";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Stere"),
        "emDebug": m0,
        "emFieldRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "emInvalidPrice": MessageLookupByLibrary.simpleMessage(
            "The price must be greater than 0"),
        "emNoObjectsRegistered": m1,
        "emPageNotFound":
            MessageLookupByLibrary.simpleMessage("Page Not Found"),
        "emTagRequired":
            MessageLookupByLibrary.simpleMessage("A tag is required"),
        "ilPrice": MessageLookupByLibrary.simpleMessage("Price"),
        "lblAssets": m2,
        "lblCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "lblCategories": m3,
        "lblConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "lblCreateObject": m4,
        "lblDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "lblDone": MessageLookupByLibrary.simpleMessage("Done"),
        "lblEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "lblHome": MessageLookupByLibrary.simpleMessage("Home"),
        "lblLogout": MessageLookupByLibrary.simpleMessage("Log out"),
        "lblMore": MessageLookupByLibrary.simpleMessage("More"),
        "lblName": MessageLookupByLibrary.simpleMessage("Name"),
        "lblRentals": m5,
        "lblSave": MessageLookupByLibrary.simpleMessage("Save"),
        "lblSend": MessageLookupByLibrary.simpleMessage("Send"),
        "lblSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "lblTags": MessageLookupByLibrary.simpleMessage("Tags"),
        "msgAreYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "msgAutomotive": MessageLookupByLibrary.simpleMessage(
            "Click if the category contains automotive items"),
        "msgFailedCreateObject": m6,
        "msgFailedDeleteObject": m7,
        "msgMissingCategory": MessageLookupByLibrary.simpleMessage(
            "To select a tag, pick a category"),
        "msgNoRegisters": m8,
        "msgPageNotFound":
            MessageLookupByLibrary.simpleMessage("Page not found"),
        "msgRegisteredSuccessfully":
            MessageLookupByLibrary.simpleMessage("Registered successfully"),
        "msgSuccessCreateObject": m9,
        "msgSuccessDeleteObject": m10,
        "msgVerifyEmail": m11,
        "msgWarningDeleteCategory": MessageLookupByLibrary.simpleMessage(
            "This will delete the category and all its assets. You won\'t be able to undo this action."),
        "msgWelcome": MessageLookupByLibrary.simpleMessage("Welcome to Stere"),
        "msgYouHaveInformation": MessageLookupByLibrary.simpleMessage(
            "You have information in the form, are you sure you want to discard your changes?"),
        "resultCreateFailure": m12,
        "resultCreateSuccess": m13,
        "resultDeleteSuccess": m14,
        "stActiveRentals":
            MessageLookupByLibrary.simpleMessage("Active Rentals"),
        "stVerifyEmail": MessageLookupByLibrary.simpleMessage("Verify Email")
      };
}
