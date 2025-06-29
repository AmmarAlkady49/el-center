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

  /// `Online Study is the`
  String get onboarding_thinTitle1 {
    return Intl.message(
      'Online Study is the',
      name: 'onboarding_thinTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Best platform for both`
  String get onboarding_thinTitle2 {
    return Intl.message(
      'Best platform for both',
      name: 'onboarding_thinTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Learn Anytime,`
  String get onboarding_thinTitle3 {
    return Intl.message(
      'Learn Anytime,',
      name: 'onboarding_thinTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Best choice for`
  String get onboarding_boldTitle1 {
    return Intl.message(
      'Best choice for',
      name: 'onboarding_boldTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Teachers & Learners`
  String get onboarding_boldTitle2 {
    return Intl.message(
      'Teachers & Learners',
      name: 'onboarding_boldTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Anywhere. Accelerate`
  String get onboarding_boldTitle3 {
    return Intl.message(
      'Anywhere. Accelerate',
      name: 'onboarding_boldTitle3',
      desc: '',
      args: [],
    );
  }

  /// `everyone.`
  String get onboarding_highlightedTitle1 {
    return Intl.message(
      'everyone.',
      name: 'onboarding_highlightedTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Teachers & Learners.`
  String get onboarding_highlightedTitle2 {
    return Intl.message(
      'Teachers & Learners.',
      name: 'onboarding_highlightedTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Your Future and beyond..`
  String get onboarding_highlightedTitle3 {
    return Intl.message(
      'Your Future and beyond..',
      name: 'onboarding_highlightedTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Start learning!`
  String get startLearning {
    return Intl.message(
      'Start learning!',
      name: 'startLearning',
      desc: '',
      args: [],
    );
  }

  /// `ع`
  String get changeLanguage {
    return Intl.message('ع', name: 'changeLanguage', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
