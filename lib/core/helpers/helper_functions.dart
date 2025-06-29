import 'package:flutter/material.dart';

class HelperFunctions {

  /// Calculates the width of a word with a given [TextStyle].
  static double getWordWidth(String word, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: word, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width + 60;
  }
}
