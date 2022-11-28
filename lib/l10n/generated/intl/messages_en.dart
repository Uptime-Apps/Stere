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

  static String m3(object, count) => "${object} Available: ${count}";

  static String m4(isPlural) =>
      "${Intl.plural(isPlural, one: 'Category', other: 'Categories')}";

  static String m5(object) => "New ${object}";

  static String m6(hours) =>
      "${Intl.plural(hours, one: '1 hour', other: '${hours} hours')}";

  static String m7(isPlural) =>
      "${Intl.plural(isPlural, one: 'Rental', other: 'Rentals')}";

  static String m8(object) => "Failed to create \"${object}\"";

  static String m9(object) => "Failed to delete \"${object}\"";

  static String m10(object) => "Failed to update \"${object}\"";

  static String m11(status) => "${Intl.select(status, {
            'false': 'The form is missing information or has invalid data',
            'other': 'The form\'s information is valid',
          })}";

  static String m12(itemLabel) => "You have no ${itemLabel} registered";

  static String m13(objects) => "No ${objects} available";

  static String m14(object) => "Created \"${object}\" successfully";

  static String m15(object) => "Deleted \"${object}\" successfully";

  static String m16(object) => "Updated \"${object}\" successfully";

  static String m17(email) =>
      "Before you begin, please verify your account. Send verification email to ${email}";

  static String m18(time) => "Rented for ${time}";

  static String m19(price) => "${price}";

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
        "emServerError": MessageLookupByLibrary.simpleMessage(
            "There was an error in the server"),
        "emTagRequired":
            MessageLookupByLibrary.simpleMessage("A tag is required"),
        "exClientBackupPhone": MessageLookupByLibrary.simpleMessage(
            "Hotel, AirBnB, family member..."),
        "ilPrice": MessageLookupByLibrary.simpleMessage("Price"),
        "lblAssets": m2,
        "lblAvailableCount": m3,
        "lblCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "lblCategories": m4,
        "lblClientBackupPhone":
            MessageLookupByLibrary.simpleMessage("Backup Phone"),
        "lblClientDeposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "lblClientDepositIdentification":
            MessageLookupByLibrary.simpleMessage("Identification"),
        "lblClientDepositPassport":
            MessageLookupByLibrary.simpleMessage("Passport"),
        "lblClientEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "lblClientHousing": MessageLookupByLibrary.simpleMessage("Housing"),
        "lblClientId":
            MessageLookupByLibrary.simpleMessage("Identification number"),
        "lblClientName": MessageLookupByLibrary.simpleMessage("Name"),
        "lblClientPhone": MessageLookupByLibrary.simpleMessage("Phone"),
        "lblClose": MessageLookupByLibrary.simpleMessage("Close"),
        "lblConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "lblCreateNew": MessageLookupByLibrary.simpleMessage("Create one!"),
        "lblCreateObject": m5,
        "lblDamageReport":
            MessageLookupByLibrary.simpleMessage("Damage Report"),
        "lblDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "lblDone": MessageLookupByLibrary.simpleMessage("Done"),
        "lblEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "lblFinalMileage":
            MessageLookupByLibrary.simpleMessage("Final Mileage"),
        "lblHistory": MessageLookupByLibrary.simpleMessage("History"),
        "lblHome": MessageLookupByLibrary.simpleMessage("Home"),
        "lblHours": m6,
        "lblInitialMileage":
            MessageLookupByLibrary.simpleMessage("Initial Mileage"),
        "lblLogout": MessageLookupByLibrary.simpleMessage("Log out"),
        "lblMore": MessageLookupByLibrary.simpleMessage("More"),
        "lblName": MessageLookupByLibrary.simpleMessage("Name"),
        "lblNo": MessageLookupByLibrary.simpleMessage("No"),
        "lblNotAvailable":
            MessageLookupByLibrary.simpleMessage("Not Available"),
        "lblNotesReport": MessageLookupByLibrary.simpleMessage("Notes"),
        "lblNotifications":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "lblPrice": MessageLookupByLibrary.simpleMessage("Price"),
        "lblRentalHistory":
            MessageLookupByLibrary.simpleMessage("Rental History"),
        "lblRentals": m7,
        "lblSave": MessageLookupByLibrary.simpleMessage("Save"),
        "lblSelectedAssets":
            MessageLookupByLibrary.simpleMessage("Selected Assets"),
        "lblSend": MessageLookupByLibrary.simpleMessage("Send"),
        "lblSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "lblTags": MessageLookupByLibrary.simpleMessage("Tags"),
        "lblTotal": MessageLookupByLibrary.simpleMessage("Total"),
        "lblYes": MessageLookupByLibrary.simpleMessage("Yes"),
        "msgAreYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "msgAutomotive": MessageLookupByLibrary.simpleMessage(
            "Click if the category contains automotive items"),
        "msgFailedCreateObject": m8,
        "msgFailedDeleteObject": m9,
        "msgFailedUpdateObject": m10,
        "msgFormStatus": m11,
        "msgMissingCategory": MessageLookupByLibrary.simpleMessage(
            "To select a tag, pick a category"),
        "msgNoInformation":
            MessageLookupByLibrary.simpleMessage("No information"),
        "msgNoRegisters": m12,
        "msgNoRentalsActive": MessageLookupByLibrary.simpleMessage(
            "No rentals active at the moment"),
        "msgNothingAvailable": m13,
        "msgNothingToSee":
            MessageLookupByLibrary.simpleMessage("Nothing to see here"),
        "msgPageNotFound":
            MessageLookupByLibrary.simpleMessage("Page not found"),
        "msgRegisteredSuccessfully":
            MessageLookupByLibrary.simpleMessage("Registered successfully"),
        "msgSuccessCreateObject": m14,
        "msgSuccessDeleteObject": m15,
        "msgSuccessUpdateObject": m16,
        "msgVerifyEmail": m17,
        "msgWarningDeleteCategory": MessageLookupByLibrary.simpleMessage(
            "This will delete the category and all its assets. You won\'t be able to undo this action."),
        "msgWelcome": MessageLookupByLibrary.simpleMessage("Welcome to Stere"),
        "msgYouHaveInformation": MessageLookupByLibrary.simpleMessage(
            "You have information in the form, are you sure you want to discard your changes?"),
        "optIdentification":
            MessageLookupByLibrary.simpleMessage("Identification"),
        "optPassport": MessageLookupByLibrary.simpleMessage("Passport"),
        "pfxRentedFor": m18,
        "priceFormat": m19,
        "stActiveRentals":
            MessageLookupByLibrary.simpleMessage("Active Rentals"),
        "stInformationDialogNewRental": MessageLookupByLibrary.simpleMessage(
            "What to do with selected assets?"),
        "stInformationDialogNewRentalDelete":
            MessageLookupByLibrary.simpleMessage(
                "Delete them by swiping one of your selected assets to the left"),
        "stInformationDialogNewRentalEdit": MessageLookupByLibrary.simpleMessage(
            "Edit them by swiping one of your selected assets to the right"),
        "stVerifyEmail": MessageLookupByLibrary.simpleMessage("Verify Email"),
        "stepAvailableAssets":
            MessageLookupByLibrary.simpleMessage("Available Assets"),
        "stepClientDetails":
            MessageLookupByLibrary.simpleMessage("Customer Details"),
        "stepFinalReview": MessageLookupByLibrary.simpleMessage("Final Review"),
        "stepRentalInformation":
            MessageLookupByLibrary.simpleMessage("Rental Information"),
        "ttActive": MessageLookupByLibrary.simpleMessage("Active"),
        "ttAvailable": MessageLookupByLibrary.simpleMessage("Available"),
        "ttCanceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "ttClosed": MessageLookupByLibrary.simpleMessage("Closed"),
        "ttDiscarded": MessageLookupByLibrary.simpleMessage("Discarded"),
        "ttIncomplete": MessageLookupByLibrary.simpleMessage("Incomplete"),
        "ttMaintenance": MessageLookupByLibrary.simpleMessage("Maintenance"),
        "ttOverdue": MessageLookupByLibrary.simpleMessage("Overdue"),
        "ttReady": MessageLookupByLibrary.simpleMessage("Ready"),
        "ttRented": MessageLookupByLibrary.simpleMessage("Rented"),
        "ttUnavailable": MessageLookupByLibrary.simpleMessage("Unavailable"),
        "ttUndefined": MessageLookupByLibrary.simpleMessage("Undefined")
      };
}
