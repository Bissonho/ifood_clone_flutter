import 'package:flutter/material.dart';

import '../components/banners_component.dart';
import '../core/theme/app_imagens.dart';

class BannerSession extends StatelessWidget {
  const BannerSession({super.key});

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
