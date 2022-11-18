import 'package:flutter/material.dart';
import 'package:ifood_clone/components/header_local_component.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/views/content/restaurant_page.dart';
import '../../components/content_tab_bar_component.dart';
import '../../controllers/contente_controller.dart';
import '../../ifood_icons_icons.dart';
import 'home_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final controller = ContentController();
  int _selectedIndex = 0;

  List<IconData> iconList = [
    IfoodIcons.home,
    IfoodIcons.add_to_photos,
    IfoodIcons.arrow_down,
  ];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black.withOpacity(0.85),
          unselectedItemColor: Colors.black.withOpacity(0.4),
          currentIndex: _selectedIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                label: 'Início',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.home),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.home_active),
                )),
            BottomNavigationBarItem(
                label: 'Busca',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.search),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.search_active),
                )),
            BottomNavigationBarItem(
                label: 'Pedidos',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.orders),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.orders_active),
                )),
            BottomNavigationBarItem(
                label: 'Perfil',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.profile),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(IfoodIcons.profile_active),
                )),
          ]),
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
          body: DefaultTabController(
            length: 6,
            child: TabBarView(controller: _tabController, children: [
              HomePage(),
              RestaurantPage(),
            ]),
          ),
        ),
      ),
    );
  }
}
