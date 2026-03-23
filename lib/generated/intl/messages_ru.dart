// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(message) => "Ошибка: ${message}";

  static String m1(gender, age, weight, height, goal, jsonStructure) =>
      "Ты — профессиональный диетолог. Составь план питания на один день для пользователя: Пол: ${gender}, Возраст: ${age}, Вес: ${weight}кг, Рост: ${height}см. Цель: ${goal}. Ответь СТРОГО в формате JSON без markdown. Структура: ${jsonStructure}";

  static String m2(calories) => "Общая калорийность: ${calories} ккал";

  static String m3(p, f, c) => "Белки: ${p}, жиры: ${f}, углеводы ${c}";

  static String m4(field) => "Введите ${field}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "age": MessageLookupByLibrary.simpleMessage("Возраст (лет)"),
    "appTitle": MessageLookupByLibrary.simpleMessage("AI План Питания"),
    "editProfile": MessageLookupByLibrary.simpleMessage(
      "Редактировать профиль",
    ),
    "error": m0,
    "formatError": MessageLookupByLibrary.simpleMessage(
      "Ошибка формата данных:",
    ),
    "geminiPrompt": m1,
    "gender": MessageLookupByLibrary.simpleMessage("Пол"),
    "genderFemale": MessageLookupByLibrary.simpleMessage("Женский"),
    "genderMale": MessageLookupByLibrary.simpleMessage("Мужской"),
    "generatePlan": MessageLookupByLibrary.simpleMessage(
      "Сгенерировать план на сегодня",
    ),
    "goal": MessageLookupByLibrary.simpleMessage("Цель"),
    "goalLoss": MessageLookupByLibrary.simpleMessage("похудение"),
    "goalMaintenance": MessageLookupByLibrary.simpleMessage("поддержание"),
    "goalMass": MessageLookupByLibrary.simpleMessage("масса"),
    "height": MessageLookupByLibrary.simpleMessage("Рост (см)"),
    "inputAge": MessageLookupByLibrary.simpleMessage("Введите возраст"),
    "inputHeight": MessageLookupByLibrary.simpleMessage("Введите рост"),
    "inputWeight": MessageLookupByLibrary.simpleMessage("Введите вес"),
    "jsonStructure": MessageLookupByLibrary.simpleMessage(
      "{\"calories\": \"число\", \"pfc\": {\"p\": \"белки\", \"f\": \"жиры\", \"c\": \"углеводы\"}, \"meals\": [{\"time\": \"Завтрак\", \"dish\": \"название\", \"recipe\": \"кратко\"}]}",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
    "pressButtonToGenerate": MessageLookupByLibrary.simpleMessage(
      "Нажмите кнопку для генерации",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "saveError": MessageLookupByLibrary.simpleMessage(
      "Ошибка сохранения. Проверьте подключение к интернету.",
    ),
    "selectGender": MessageLookupByLibrary.simpleMessage("Выберите пол"),
    "selectGoal": MessageLookupByLibrary.simpleMessage("Выберите цель"),
    "summary": m2,
    "summaryAdditional": m3,
    "validationNumber": MessageLookupByLibrary.simpleMessage("Введите число"),
    "validationRequired": m4,
    "weight": MessageLookupByLibrary.simpleMessage("Вес (кг)"),
  };
}
