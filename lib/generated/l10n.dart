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

  /// `Sign in to your \nAccount`
  String get signinToYourAccount {
    return Intl.message(
      'Sign in to your \nAccount',
      name: 'signinToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message('Sign up', name: 'signup', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Type your email`
  String get typeYourEmail {
    return Intl.message(
      'Type your email',
      name: 'typeYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Type your password`
  String get typeYourPassword {
    return Intl.message(
      'Type your password',
      name: 'typeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Sign in`
  String get signin {
    return Intl.message('Sign in', name: 'signin', desc: '', args: []);
  }

  /// `Or login with`
  String get orLoginWith {
    return Intl.message(
      'Or login with',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
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
