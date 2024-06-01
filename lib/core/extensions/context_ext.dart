import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  FlutterDeckTextTheme get textTheme => FlutterDeckTheme.of(this).textTheme;
}
