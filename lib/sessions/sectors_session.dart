import 'package:flutter/material.dart';

import '../components/category_item_component.dart';
import '../components/sector_item_component.dart';
import '../models/category.dart';

class SectorsSession extends StatelessWidget {
  const SectorsSession({super.key, required this.sectors});
  final List<Category> sectors;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SizedBox(
          //color: Colors.red,
          height: 200,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: sectors.length,
            itemBuilder: (BuildContext context, int index) {
              return SectorItemComponent(category: sectors[index]);
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          ),
        ),
      ),
    );
  }
}
