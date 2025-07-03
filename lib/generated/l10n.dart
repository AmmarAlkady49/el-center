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

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAvalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get pleaseEnterAvalidPassword {
    return Intl.message(
      'Please enter a valid password',
      name: 'pleaseEnterAvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Type your first name`
  String get typeYourFirstName {
    return Intl.message(
      'Type your first name',
      name: 'typeYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Type your last name`
  String get typeYourLastName {
    return Intl.message(
      'Type your last name',
      name: 'typeYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `No country found`
  String get noCountryFound {
    return Intl.message(
      'No country found',
      name: 'noCountryFound',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message('Student', name: 'student', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `Please enter your phone number`
  String get pleaseEnterYourPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAvalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterYourFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterYourLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get pleaseEnterYourConfirmPassword {
    return Intl.message(
      'Please enter your confirm password',
      name: 'pleaseEnterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password too weak`
  String get passwordTooWeak {
    return Intl.message(
      'Password too weak',
      name: 'passwordTooWeak',
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
