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
