// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ifood_clone/core/theme/app_typography.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_icons.dart';

class FilterComponenet extends StatelessWidget {
  const FilterComponenet({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: _FilterComponenetDelegate('teste'));
  }
}

class _FilterComponenetDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  _FilterComponenetDelegate(this.location);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      height: 54,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 16),
          FilterItemComponent(icon: AppIcons.arrowDown, label: 'Ordenar'),
          FilterItemComponent(label: 'Pra Retirar'),
          FilterItemComponent(label: 'Entrega grátis'),
          FilterItemComponent(icon: AppIcons.arrowDown, label: 'Vale-refeição'),
          FilterItemComponent(icon: AppIcons.arrowDown, label: 'Distância'),
          FilterItemComponent(label: 'Entrega parceira'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 54;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  FilterItemComponent({
    Key? key,
    required this.label,
    this.icon,
  }) : super(key: key);

  final String label;
  String? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: AppColors.white,
            border: Border.all(color: AppColors.grey30)),
        child: Padding(
          padding: EdgeInsets.only(
            left: icon == null ? 8.0 : 6,
            right: icon == null ? 8.0 : 8,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  label,
                  style: AppTypography.filterItemStyle(context)!
                      .copyWith(color: AppColors.grey70),
                ),
              ),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: AppIcon(
                    icon!,
                    size: Size(14, 14),
                    color: AppColors.grey70,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
