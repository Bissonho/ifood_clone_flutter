import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';

import '../core/theme/app_icons.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final List<BottomNavigatorItemComponent> items;
  final int currentIndex;
  final Function onTap;

  const BottomNavigatorComponent(
      {super.key,
      required this.items,
      required this.currentIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items
                  .map(
                    (e) => e.copyWith(
                      isActive: items.indexOf(e) == currentIndex,
                      onTap: () => onTap(items.indexOf(e)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigatorItemComponent extends StatelessWidget {
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;
  final void Function()? onTap;

  BottomNavigatorItemComponent copyWith(
      {String? label,
      String? activeIcon,
      String? icon,
      bool? isActive,
      void Function()? onTap}) {
    return BottomNavigatorItemComponent(
      activeIcon: activeIcon ?? this.activeIcon,
      icon: icon ?? this.icon,
      isActive: isActive ?? false,
      label: label ?? this.label,
      onTap: onTap ?? this.onTap,
    );
  }

  const BottomNavigatorItemComponent(
      {super.key,
      required this.label,
      required this.activeIcon,
      required this.icon,
      this.isActive = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            AppIcon(isActive ? activeIcon : icon),
            Text(
              label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
