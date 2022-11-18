import 'package:flutter/material.dart';

import '../../components/filters_component.dart';
import '../../components/restaurant_list.dart';
import '../../controllers/contente_controller.dart';
import '../../core/theme/app_typography.dart';
import '../../sessions/banner_session.dart';
import '../../sessions/categories_session.dart';
import '../../sessions/sectors_session.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final sectors = ContentController().getSectors().toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              return await Future.value();
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SectorsSession(sectors: sectors),
                const BannerSession(),
                const FilterComponenet(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 18),
                    child: Text(
                      'Lojas',
                      style: AppTypography.sessionTitle(context),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(restaurants
                        .map((e) => RestaurantItemComponent(restaurant: e))
                        .toList()))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
