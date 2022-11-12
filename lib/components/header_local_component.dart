import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';
import '../core/theme/app_icons.dart';

class HeaderLocationComponent extends StatelessWidget {
  final String Location;
  const HeaderLocationComponent({super.key, required this.Location});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    Location,
                    style: AppTypography.LocalTextStyle(context),
                  ),
                  AppIcon(
                    AppIcons.arrowDown,
                    color: Theme.of(context).primaryColor,
                    size: const Size(20, 20),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
