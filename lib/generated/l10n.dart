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
  String get simpleTex9 {
    return Intl.message(
      'Network request failed',
      name: 'simpleTex9',
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
  String get simpleTexct15 {
    return Intl.message(
      'Invalid fields',
      name: 'simpleTexct15',
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
