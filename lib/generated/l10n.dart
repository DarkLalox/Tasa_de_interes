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

  /// `Sign in`
  String get simpleText {
    return Intl.message(
      'Sign in',
      name: 'simpleText',
      desc: '',
      args: [],
    );
  }

  /// `Fogot password?`
  String get simpleText2 {
    return Intl.message(
      'Fogot password?',
      name: 'simpleText2',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get simpleText3 {
    return Intl.message(
      'Don\'t have an account?',
      name: 'simpleText3',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get simpleText4 {
    return Intl.message(
      'Sign up',
      name: 'simpleText4',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get simpleText5 {
    return Intl.message(
      'Email',
      name: 'simpleText5',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get simpleText6 {
    return Intl.message(
      'Invalid email',
      name: 'simpleText6',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get simpleText7 {
    return Intl.message(
      'Invalid password',
      name: 'simpleText7',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get simpleText8 {
    return Intl.message(
      'Password',
      name: 'simpleText8',
      desc: '',
      args: [],
    );
  }

  /// `Network request failed`
  String get simpleText9 {
    return Intl.message(
      'Network request failed',
      name: 'simpleText9',
      desc: '',
      args: [],
    );
  }

  /// `User disabled`
  String get simpleText10 {
    return Intl.message(
      'User disabled',
      name: 'simpleText10',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get simpleText11 {
    return Intl.message(
      'User not found',
      name: 'simpleText11',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get simpleText12 {
    return Intl.message(
      'Wrong password',
      name: 'simpleText12',
      desc: '',
      args: [],
    );
  }

  /// `Too Many Requests`
  String get simpleText13 {
    return Intl.message(
      'Too Many Requests',
      name: 'simpleText13',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get simpleText14 {
    return Intl.message(
      'Unknown error',
      name: 'simpleText14',
      desc: '',
      args: [],
    );
  }

  /// `Invalid fields`
  String get simpleText15 {
    return Intl.message(
      'Invalid fields',
      name: 'simpleText15',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get simpleText16 {
    return Intl.message(
      'Sign up',
      name: 'simpleText16',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get simpleText17 {
    return Intl.message(
      'Name',
      name: 'simpleText17',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name`
  String get simpleText18 {
    return Intl.message(
      'Invalid name',
      name: 'simpleText18',
      desc: '',
      args: [],
    );
  }

  /// `Name PYME`
  String get simpleText19 {
    return Intl.message(
      'Name PYME',
      name: 'simpleText19',
      desc: '',
      args: [],
    );
  }

  /// `Enter PYME`
  String get simpleText20 {
    return Intl.message(
      'Enter PYME',
      name: 'simpleText20',
      desc: '',
      args: [],
    );
  }

  /// `Verification password`
  String get simpleText21 {
    return Intl.message(
      'Verification password',
      name: 'simpleText21',
      desc: '',
      args: [],
    );
  }

  /// `Password don't match`
  String get simpleText22 {
    return Intl.message(
      'Password don\'t match',
      name: 'simpleText22',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get simpleText23 {
    return Intl.message(
      'Register',
      name: 'simpleText23',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use`
  String get simpleText24 {
    return Intl.message(
      'Email is already in use',
      name: 'simpleText24',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get simpleText25 {
    return Intl.message(
      'Weak password',
      name: 'simpleText25',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get simpleText26 {
    return Intl.message(
      'Reset password',
      name: 'simpleText26',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to recive a link to change your password`
  String get simpleText27 {
    return Intl.message(
      'Enter your email to recive a link to change your password',
      name: 'simpleText27',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get simpleText28 {
    return Intl.message(
      'Send',
      name: 'simpleText28',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get simpleText29 {
    return Intl.message(
      'Good',
      name: 'simpleText29',
      desc: '',
      args: [],
    );
  }

  /// `Email sent`
  String get simpleText30 {
    return Intl.message(
      'Email sent',
      name: 'simpleText30',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get simpleText31 {
    return Intl.message(
      'Check your internet connection',
      name: 'simpleText31',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get simpleText32 {
    return Intl.message(
      'User',
      name: 'simpleText32',
      desc: '',
      args: [],
    );
  }

  /// `Email verified`
  String get simpleText33 {
    return Intl.message(
      'Email verified',
      name: 'simpleText33',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get simpleText34 {
    return Intl.message(
      'YES',
      name: 'simpleText34',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get simpleText35 {
    return Intl.message(
      'Dark mode',
      name: 'simpleText35',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get simpleText36 {
    return Intl.message(
      'Sign out',
      name: 'simpleText36',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get simpleText37 {
    return Intl.message(
      'Save',
      name: 'simpleText37',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get simpleText38 {
    return Intl.message(
      'Cancel',
      name: 'simpleText38',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {name}`
  String textWithPlaceholder(Object name) {
    return Intl.message(
      'Welcome, $name',
      name: 'textWithPlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `Mobile application with useful information on interest rates collected`
  String get simpleText39 {
    return Intl.message(
      'Mobile application with useful information on interest rates collected',
      name: 'simpleText39',
      desc: '',
      args: [],
    );
  }

  /// `from the Central Bank of Chile and news collected from NewApi`
  String get simpleText40 {
    return Intl.message(
      'from the Central Bank of Chile and news collected from NewApi',
      name: 'simpleText40',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get simpleText41 {
    return Intl.message(
      'Home',
      name: 'simpleText41',
      desc: '',
      args: [],
    );
  }

  /// `Interest rate`
  String get simpleText42 {
    return Intl.message(
      'Interest rate',
      name: 'simpleText42',
      desc: '',
      args: [],
    );
  }

  /// `Graphics`
  String get simpleText43 {
    return Intl.message(
      'Graphics',
      name: 'simpleText43',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get simpleText44 {
    return Intl.message(
      'News',
      name: 'simpleText44',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get simpleText45 {
    return Intl.message(
      'Language',
      name: 'simpleText45',
      desc: '',
      args: [],
    );
  }

  /// `MPR calculator`
  String get simpleText46 {
    return Intl.message(
      'MPR calculator',
      name: 'simpleText46',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get simpleText47 {
    return Intl.message(
      'No data',
      name: 'simpleText47',
      desc: '',
      args: [],
    );
  }

  /// `Choose a date`
  String get simpleText48 {
    return Intl.message(
      'Choose a date',
      name: 'simpleText48',
      desc: '',
      args: [],
    );
  }

  /// `The day {day}`
  String textWithPlaceholder2(Object day) {
    return Intl.message(
      'The day $day',
      name: 'textWithPlaceholder2',
      desc: '',
      args: [day],
    );
  }

  /// `The interest rate is : {interest} %`
  String textWithPlaceholder3(Object interest) {
    return Intl.message(
      'The interest rate is : $interest %',
      name: 'textWithPlaceholder3',
      desc: '',
      args: [interest],
    );
  }

  /// `Monerary policy rate (MPR)`
  String get simpleText49 {
    return Intl.message(
      'Monerary policy rate (MPR)',
      name: 'simpleText49',
      desc: '',
      args: [],
    );
  }

  /// `Interbank interest rate (IBR)`
  String get simpleText50 {
    return Intl.message(
      'Interbank interest rate (IBR)',
      name: 'simpleText50',
      desc: '',
      args: [],
    );
  }

  /// `Consumer`
  String get simpleText51 {
    return Intl.message(
      'Consumer',
      name: 'simpleText51',
      desc: '',
      args: [],
    );
  }

  /// `Housing`
  String get simpleText52 {
    return Intl.message(
      'Housing',
      name: 'simpleText52',
      desc: '',
      args: [],
    );
  }

  /// `Foreign trade`
  String get simpleText53 {
    return Intl.message(
      'Foreign trade',
      name: 'simpleText53',
      desc: '',
      args: [],
    );
  }

  /// `Commercial`
  String get simpleText54 {
    return Intl.message(
      'Commercial',
      name: 'simpleText54',
      desc: '',
      args: [],
    );
  }

  /// `MPR chart`
  String get simpleText55 {
    return Intl.message(
      'MPR chart',
      name: 'simpleText55',
      desc: '',
      args: [],
    );
  }

  /// `IBR chart`
  String get simpleText56 {
    return Intl.message(
      'IBR chart',
      name: 'simpleText56',
      desc: '',
      args: [],
    );
  }

  /// `Housing chart`
  String get simpleText57 {
    return Intl.message(
      'Housing chart',
      name: 'simpleText57',
      desc: '',
      args: [],
    );
  }

  /// `Foreign trade chart`
  String get simpleText58 {
    return Intl.message(
      'Foreign trade chart',
      name: 'simpleText58',
      desc: '',
      args: [],
    );
  }

  /// `Consumer chart`
  String get simpleText59 {
    return Intl.message(
      'Consumer chart',
      name: 'simpleText59',
      desc: '',
      args: [],
    );
  }

  /// `Commercial chart`
  String get simpleText60 {
    return Intl.message(
      'Commercial chart',
      name: 'simpleText60',
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
      Locale.fromSubtags(languageCode: 'es'),
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
