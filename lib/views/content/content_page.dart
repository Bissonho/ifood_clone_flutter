import 'package:flutter/material.dart';
import 'package:ifood_clone/components/filters_component.dart';
import 'package:ifood_clone/components/header_local_component.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';
import '../../components/content_tab_bar_component.dart';
import '../../components/restaurant_list.dart';
import '../../controllers/contente_controller.dart';
import '../../sessions/banner_session.dart';
import '../../sessions/bottom_navigator_session.dart';
import '../../sessions/categories_session.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final controller = ContentController();
  final cat = ContentController().getCategorys().toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxScroll) {
            return [
              const HeaderLocationComponent(
                location: 'R. Domingos Viana, 541',
              ),
              ContentTabBarComponent(
                onTap: (_) {},
                tabController: _tabController,
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      CategoriesSession(categorys: cat),
                      const BannerSession(),
                      FilterComponenet(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 18),
                          child: Text(
                            'Lojas',
                            style: AppTypography.sessionTitle(context),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate(restaurants
                              .map(
                                  (e) => RestaurantItemComponent(restaurant: e))
                              .toList()))
                    ],
                  ),
                ),
              ),
              BottomNavigatorSession(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
