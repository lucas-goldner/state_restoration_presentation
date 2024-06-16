import 'dart:developer';

import 'package:dart_style/dart_style.dart';

/// Formats the provided [code] using the [DartFormatter].
///
/// Returns the formatted code if formatting is successful.
/// If a [FormatterException] occurs during formatting,
/// it logs the exception and returns the original [code].
String formatCode(String code) {
  final formatter = DartFormatter();

  try {
    return formatter.format(code);
  } on FormatterException catch (ex) {
    log('$ex');
    return code;
  }
}
