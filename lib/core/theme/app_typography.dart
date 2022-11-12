import 'dart:ui';

import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle? bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? bodyTextBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle? LocalTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 13);
  }
}
