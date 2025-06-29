import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  S get loc => S.of(this);

  String get currentLanguageCode => locale.languageCode;

  String get currentCountryCode => locale.countryCode ?? '';
}