import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class ContentTabBarComponent extends StatelessWidget {
  const ContentTabBarComponent(
      {super.key, required this.tabController, required this.onTap});

  final Function(int) onTap;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponentDelegate(onTap, tabController),
    );
  }
}

class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final Function(int) onTap;
  final TabController tabController;

  _ContentTabBarComponentDelegate(this.onTap, this.tabController);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          TabBar(
              isScrollable: true,
              onTap: onTap,
              labelPadding: const EdgeInsets.only(left: 13, right: 0),
              indicatorPadding: const EdgeInsets.only(left: 13, right: 0),
              unselectedLabelColor: AppColors.black54,
              labelStyle: AppTypography.bodyText(context)
                  ?.copyWith(color: Colors.black),
              labelColor: AppColors.primaryColor,
              indicator: MaterialIndicator(
                  color: AppColors.primaryColor,
                  height: 1.5,
                  bottomLeftRadius: 5,
                  bottomRightRadius: 5),
              controller: tabController,
              tabs: const [
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text(
                      'Início',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text('Restaurantes', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text('Mercados', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text('Bebidas', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text('Farmácias', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Tab(
                    child: Text('Pets', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ]),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
