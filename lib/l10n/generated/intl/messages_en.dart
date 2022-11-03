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

  static String m6(itemName) => "An error occurred while creating ${itemName}";

  static String m7(itemName) => "${itemName} was created";

  static String m8(itemName) =>
      "All data from category ${itemName} was removed";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Stere"),
        "emDebug": m0,
        "emNoObjectsRegistered": m1,
        "emPageNotFound":
            MessageLookupByLibrary.simpleMessage("Page Not Found"),
        "lblAssets": m2,
        "lblCategories": m3,
        "lblCreateObject": m4,
        "lblHome": MessageLookupByLibrary.simpleMessage("Home"),
        "lblLogout": MessageLookupByLibrary.simpleMessage("Log out"),
        "lblMore": MessageLookupByLibrary.simpleMessage("More"),
        "lblRentals": m5,
        "lblSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "resultCreateFailure": m6,
        "resultCreateSuccess": m7,
        "resultDeleteSuccess": m8,
        "stActiveRentals":
            MessageLookupByLibrary.simpleMessage("Active Rentals")
      };
}
