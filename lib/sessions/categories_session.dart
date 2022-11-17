import 'package:flutter/material.dart';

import '../components/category_item_component.dart';
import '../models/category.dart';

class CategoriesSession extends StatelessWidget {
  const CategoriesSession({super.key, required this.categorys});
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
