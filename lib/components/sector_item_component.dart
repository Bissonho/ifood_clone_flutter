// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';

import '../models/category.dart';

class SectorItemComponent extends StatelessWidget {
  const SectorItemComponent({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              category.picture,
              height: 65,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            category.name,
            style: AppTypography.small(context)?.copyWith(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
