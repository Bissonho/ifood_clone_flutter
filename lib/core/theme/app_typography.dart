import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';

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

  static TextStyle? localTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15);
  }

  static TextStyle? small(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12);
  }

  static TextStyle? filterItemStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(fontWeight: FontWeight.normal, fontSize: 13);
  }

  static TextStyle? sessionTitle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w500, fontSize: 16, fontFamily: "Arial");
  }

  static TextStyle? resrautantStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14);
  }

  static TextStyle? restaurantDetails(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: AppColors.grey70,
        );
  }
}
