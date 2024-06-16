import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/style/text_styles.dart';

final flutterDeckThemeLight = FlutterDeckThemeData(
  textTheme: FlutterDeckTextTheme(
    title: TextStyles.title,
    bodyMedium: TextStyles.regular,
    bodySmall: TextStyles.footer,
  ),
  brightness: Brightness.light,
).copyWith(
  codeHighlightTheme: FlutterDeckCodeHighlightThemeData(
    textStyle: TextStyles.footer,
  ),
);

final flutterDeckThemeDark = FlutterDeckThemeData(
  textTheme: FlutterDeckTextTheme(
    title: TextStyles.title,
    bodyMedium: TextStyles.titleDark,
    bodySmall: TextStyles.footerDark,
  ),
  brightness: Brightness.dark,
).copyWith(
  codeHighlightTheme: FlutterDeckCodeHighlightThemeData(
    textStyle: TextStyles.footerDark,
  ),
);
