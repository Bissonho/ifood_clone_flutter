import 'package:flutter/material.dart';
import 'package:ifood_clone/components/header_local_component.dart';
import '../../components/bottom_navigator_component.dart';
import '../../components/content_tab_bar_component.dart';
import '../../core/theme/app_icons.dart';

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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxScroll) {
            return [
              const HeaderLocationComponent(
                location: 'R. Domingos Viana, 541',
              ),
              ContentTabBarComponent(
                onTap: (_) {},
                tabController: _tabController,
              )
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                ),
              ),
              BottomNavigatorComponent(
                currentIndex: _currentIndex,
                items: [
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
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
