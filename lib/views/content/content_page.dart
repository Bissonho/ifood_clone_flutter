import 'package:flutter/material.dart';
import 'package:ifood_clone/components/filters_component.dart';
import 'package:ifood_clone/components/header_local_component.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_imagens.dart';
import '../../components/banners_component.dart';
import '../../components/bottom_navigator_component.dart';
import '../../components/category_item_component.dart';
import '../../components/content_tab_bar_component.dart';
import '../../controllers/contente_controller.dart';
import '../../core/theme/app_icons.dart';
import '../../models/category.dart';

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
              const FilterComponenet()
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
                      _CategorysSession(categorys: cat),
                      const _BannerSession(),
                    ],
                  ),
                ),
              ),
              _BottomNavigatorSession(
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

class _CategorysSession extends StatelessWidget {
  const _CategorysSession({super.key, required this.categorys});
  final List<Category> categorys;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categorys.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == categorys.length - 1 ? 16 : 10),
              child: CategoryItemComponent(category: categorys[index]),
            );
          },
        ),
      ),
    );
  }
}

class _BannerSession extends StatelessWidget {
  const _BannerSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 190,
        child: BannersComponenet(
          banners: [
            BannerItemComponent(imagepath: AppImages.banner1),
            BannerItemComponent(imagepath: AppImages.banner2),
            BannerItemComponent(imagepath: AppImages.banner3)
          ],
        ),
      ),
    );
  }
}

class _BottomNavigatorSession extends StatelessWidget {
  final Function onTap;
  final int currentIndex;

  const _BottomNavigatorSession(
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
