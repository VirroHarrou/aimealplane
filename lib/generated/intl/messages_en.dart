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

  static String m0(message) => "Error: ${message}";

  static String m1(gender, age, weight, height, goal, jsonStructure) =>
      "You are a professional nutritionist. Create a one-day meal plan for a user: Gender: ${gender}, Age: ${age}, Weight: ${weight}kg, Height: ${height}cm. Goal: ${goal}. Respond STRICTLY in JSON format without markdown. Structure: ${jsonStructure}";

  static String m2(calories) => "Total calories: ${calories} kcal";

  static String m3(p, f, c) => "Protein: ${p}, fat: ${f}, carbohydrates ${c}";

  static String m4(field) => "Please enter ${field}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "age": MessageLookupByLibrary.simpleMessage("Age (years)"),
    "appTitle": MessageLookupByLibrary.simpleMessage("AI Meal Planner"),
    "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "error": m0,
    "formatError": MessageLookupByLibrary.simpleMessage("Data format error:"),
    "geminiPrompt": m1,
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "genderFemale": MessageLookupByLibrary.simpleMessage("Female"),
    "genderMale": MessageLookupByLibrary.simpleMessage("Male"),
    "generatePlan": MessageLookupByLibrary.simpleMessage(
      "Generate plan for today",
    ),
    "goal": MessageLookupByLibrary.simpleMessage("Goal"),
    "goalLoss": MessageLookupByLibrary.simpleMessage("weight loss"),
    "goalMaintenance": MessageLookupByLibrary.simpleMessage("maintenance"),
    "goalMass": MessageLookupByLibrary.simpleMessage("muscle gain"),
    "height": MessageLookupByLibrary.simpleMessage("Height (cm)"),
    "inputAge": MessageLookupByLibrary.simpleMessage("Input age"),
    "inputHeight": MessageLookupByLibrary.simpleMessage("Input height"),
    "inputWeight": MessageLookupByLibrary.simpleMessage("Input weight"),
    "jsonStructure": MessageLookupByLibrary.simpleMessage(
      "{\"calories\": \"number\", \"pfc\": {\"p\": \"protein\", \"f\": \"fat\", \"c\": \"carbs\"}, \"meals\": [{\"time\": \"Breakfast\", \"dish\": \"name\", \"recipe\": \"briefly\"}]}",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "pressButtonToGenerate": MessageLookupByLibrary.simpleMessage(
      "Press the button to generate",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveError": MessageLookupByLibrary.simpleMessage(
      "Save error. Please check your internet connection.",
    ),
    "selectGender": MessageLookupByLibrary.simpleMessage("Select gender"),
    "selectGoal": MessageLookupByLibrary.simpleMessage("Select goal"),
    "summary": m2,
    "summaryAdditional": m3,
    "validationNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter a number",
    ),
    "validationRequired": m4,
    "weight": MessageLookupByLibrary.simpleMessage("Weight (kg)"),
  };
}
