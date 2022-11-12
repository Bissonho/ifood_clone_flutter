import 'package:flutter/material.dart';
import 'package:ifood_clone/components/header_local_component.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderLocationComponent(Location: "Rua das Flores do Campo, 10"),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 230),
            child: TabBar(
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                unselectedLabelColor: AppColors.black54,
                labelStyle: AppTypography.bodyText(context)
                    ?.copyWith(color: Colors.black),
                labelColor: AppColors.black,
                indicator: MaterialIndicator(
                    color: AppColors.primaryColor,
                    height: 2,
                    bottomLeftRadius: 5,
                    bottomRightRadius: 5),
                controller: _tabController,
                tabs: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Tab(
                      child: Text('Restaurantes'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Tab(
                      child: Text('Mercados'),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
