import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';
import '../core/theme/app_icons.dart';

class HeaderLocationComponent extends StatelessWidget {
  final String location;
  const HeaderLocationComponent({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _HeaderLocationcomponentDelegate(location));
  }
}

class _HeaderLocationcomponentDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  _HeaderLocationcomponentDelegate(this.location);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: AppTypography.localTextStyle(context),
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

  @override
  double get maxExtent => 38;

  @override
  double get minExtent => 38;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
