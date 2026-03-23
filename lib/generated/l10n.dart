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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AI Meal Planner`
  String get appTitle {
    return Intl.message(
      'AI Meal Planner',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Age (years)`
  String get age {
    return Intl.message('Age (years)', name: 'age', desc: '', args: []);
  }

  /// `Weight (kg)`
  String get weight {
    return Intl.message('Weight (kg)', name: 'weight', desc: '', args: []);
  }

  /// `Height (cm)`
  String get height {
    return Intl.message('Height (cm)', name: 'height', desc: '', args: []);
  }

  /// `Goal`
  String get goal {
    return Intl.message('Goal', name: 'goal', desc: '', args: []);
  }

  /// `Generate plan for today`
  String get generatePlan {
    return Intl.message(
      'Generate plan for today',
      name: 'generatePlan',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Press the button to generate`
  String get pressButtonToGenerate {
    return Intl.message(
      'Press the button to generate',
      name: 'pressButtonToGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Data format error:`
  String get formatError {
    return Intl.message(
      'Data format error:',
      name: 'formatError',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Error: {message}`
  String error(String message) {
    return Intl.message(
      'Error: $message',
      name: 'error',
      desc: '',
      args: [message],
    );
  }

  /// `Save error. Please check your internet connection.`
  String get saveError {
    return Intl.message(
      'Save error. Please check your internet connection.',
      name: 'saveError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter {field}`
  String validationRequired(String field) {
    return Intl.message(
      'Please enter $field',
      name: 'validationRequired',
      desc: '',
      args: [field],
    );
  }

  /// `Please enter a number`
  String get validationNumber {
    return Intl.message(
      'Please enter a number',
      name: 'validationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select gender`
  String get selectGender {
    return Intl.message(
      'Select gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Select goal`
  String get selectGoal {
    return Intl.message('Select goal', name: 'selectGoal', desc: '', args: []);
  }

  /// `Input age`
  String get inputAge {
    return Intl.message('Input age', name: 'inputAge', desc: '', args: []);
  }

  /// `Input height`
  String get inputHeight {
    return Intl.message(
      'Input height',
      name: 'inputHeight',
      desc: '',
      args: [],
    );
  }

  /// `Input weight`
  String get inputWeight {
    return Intl.message(
      'Input weight',
      name: 'inputWeight',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get genderMale {
    return Intl.message('Male', name: 'genderMale', desc: '', args: []);
  }

  /// `Female`
  String get genderFemale {
    return Intl.message('Female', name: 'genderFemale', desc: '', args: []);
  }

  /// `weight loss`
  String get goalLoss {
    return Intl.message('weight loss', name: 'goalLoss', desc: '', args: []);
  }

  /// `muscle gain`
  String get goalMass {
    return Intl.message('muscle gain', name: 'goalMass', desc: '', args: []);
  }

  /// `maintenance`
  String get goalMaintenance {
    return Intl.message(
      'maintenance',
      name: 'goalMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Total calories: {calories} kcal`
  String summary(int calories) {
    return Intl.message(
      'Total calories: $calories kcal',
      name: 'summary',
      desc: '',
      args: [calories],
    );
  }

  /// `Protein: {p}, fat: {f}, carbohydrates {c}`
  String summaryAdditional(String p, String f, String c) {
    return Intl.message(
      'Protein: $p, fat: $f, carbohydrates $c',
      name: 'summaryAdditional',
      desc: '',
      args: [p, f, c],
    );
  }

  /// `You are a professional nutritionist. Create a one-day meal plan for a user: Gender: {gender}, Age: {age}, Weight: {weight}kg, Height: {height}cm. Goal: {goal}. Respond STRICTLY in JSON format without markdown. Structure: {jsonStructure}`
  String geminiPrompt(
    String gender,
    int age,
    double weight,
    double height,
    String goal,
    String jsonStructure,
  ) {
    return Intl.message(
      'You are a professional nutritionist. Create a one-day meal plan for a user: Gender: $gender, Age: $age, Weight: ${weight}kg, Height: ${height}cm. Goal: $goal. Respond STRICTLY in JSON format without markdown. Structure: $jsonStructure',
      name: 'geminiPrompt',
      desc: '',
      args: [gender, age, weight, height, goal, jsonStructure],
    );
  }

  /// `{"calories": "number", "pfc": {"p": "protein", "f": "fat", "c": "carbs"}, "meals": [{"time": "Breakfast", "dish": "name", "recipe": "briefly"}]}`
  String get jsonStructure {
    return Intl.message(
      '{"calories": "number", "pfc": {"p": "protein", "f": "fat", "c": "carbs"}, "meals": [{"time": "Breakfast", "dish": "name", "recipe": "briefly"}]}',
      name: 'jsonStructure',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
