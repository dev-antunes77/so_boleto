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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Sem conexão`
  String get errorNoConnectionPage {
    return Intl.message(
      'Sem conexão',
      name: 'errorNoConnectionPage',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get signIn {
    return Intl.message(
      'Cadastrar',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get loginSubtitle {
    return Intl.message(
      'Tente novamente',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get loginTitle {
    return Intl.message(
      'Tente novamente',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get tryAgain {
    return Intl.message(
      'Tente novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get validatorEmail {
    return Intl.message(
      'Tente novamente',
      name: 'validatorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get insertNumber {
    return Intl.message(
      'Tente novamente',
      name: 'insertNumber',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get subscribeHintNumber {
    return Intl.message(
      'Tente novamente',
      name: 'subscribeHintNumber',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get termsAndPolicies1 {
    return Intl.message(
      'Tente novamente',
      name: 'termsAndPolicies1',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get termsAndPolicies2 {
    return Intl.message(
      'Tente novamente',
      name: 'termsAndPolicies2',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get termsAndPolicies3 {
    return Intl.message(
      'Tente novamente',
      name: 'termsAndPolicies3',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get loginPincodeInsert {
    return Intl.message(
      'Tente novamente',
      name: 'loginPincodeInsert',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get loginPincodeInfo {
    return Intl.message(
      'Tente novamente',
      name: 'loginPincodeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get errorUnknowError {
    return Intl.message(
      'Tente novamente',
      name: 'errorUnknowError',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get errorTryAgain {
    return Intl.message(
      'Tente novamente',
      name: 'errorTryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
