// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';

import '../models/category.dart';

class CategoryItemComponent extends StatelessWidget {
  const CategoryItemComponent({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          category.picture,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            category.name,
            style:
                AppTypography.small(context)?.copyWith(color: AppColors.grey),
          ),
        )
      ],
    );
  }
}
