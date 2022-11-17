import 'package:flutter/material.dart';

import '../components/bottom_navigator_component.dart';
import '../core/theme/app_icons.dart';

class BottomNavigatorSession extends StatelessWidget {
  final Function onTap;
  final int currentIndex;

  const BottomNavigatorSession(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      currentIndex: currentIndex,
      items: const [
        BottomNavigatorItemComponent(
          activeIcon: AppIcons.homeActive,
          icon: AppIcons.home,
          label: 'Início',
        ),
        BottomNavigatorItemComponent(
          activeIcon: AppIcons.searchActive,
          icon: AppIcons.search,
          label: 'Início',
        ),
        BottomNavigatorItemComponent(
          activeIcon: AppIcons.ordersActive,
          icon: AppIcons.orders,
          label: 'Pedidos',
        ),
        BottomNavigatorItemComponent(
          activeIcon: AppIcons.profileActive,
          icon: AppIcons.profile,
          label: 'Início',
        ),
      ],
      onTap: onTap,
    );
  }
}
