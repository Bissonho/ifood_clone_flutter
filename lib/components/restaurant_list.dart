import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_icons.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';

import '../models/restaurant.dart';

class RestaurantItemComponent extends StatelessWidget {
  const RestaurantItemComponent({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(restaurant.photoUrl),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: AppTypography.resrautantStyle(context),
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        width: 8,
                        height: 2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const AppIcon(
                        AppIcons.star,
                        size: Size(9, 9),
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        restaurant.rate.toString(),
                        style: AppTypography.restaurantDetails(context)
                            ?.copyWith(color: Colors.amber),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const _Dot(),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(restaurant.category,
                          style: AppTypography.restaurantDetails(context)),
                      const SizedBox(
                        width: 4,
                      ),
                      const _Dot(),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        restaurant.distance,
                        style: AppTypography.restaurantDetails(context),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      Text(
                          '${restaurant.time[0].toString()}-${restaurant.time[1].toString()}min',
                          style: AppTypography.restaurantDetails(context)),
                      const SizedBox(
                        width: 4,
                      ),
                      const _Dot(),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(restaurant.deliveryTaxe,
                          style: AppTypography.restaurantDetails(context))
                    ],
                  )
                ],
              ),
            ],
          ),
          const AppIcon(
            AppIcons.favLine,
            size: Size(18, 18),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '•',
      style: TextStyle(fontSize: 9, color: AppColors.grey70),
    );
  }
}

List<Restaurant> get restaurants => [
      Restaurant(
        name: 'Sushi House',
        category: 'Japonesa',
        deliveryTaxe: 'R\$ 5,99',
        distance: '4.1 km',
        rate: 4.0,
        time: [60, 70],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/201712030959_049383b5-d44f-47be-85f2-08f8bc9683df.bmp',
      ),
      Restaurant(
        name: 'Pimenta de Cheiro Saladeria',
        category: 'Saudável',
        deliveryTaxe: 'R\$ 4,99',
        distance: '2.5 km',
        rate: 4.8,
        time: [50, 60],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/45ba788f-b086-4623-95e0-9530c93d59d4/202210171705_4hPS_i.jpg',
      ),
      Restaurant(
        name: 'Sushi Rão - Campos dos Goytacazes',
        category: 'Japonesa',
        deliveryTaxe: 'R\$ 5,99',
        distance: '4.2 km',
        rate: 4.0,
        time: [25, 35],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/f26bab81-7bbc-4640-ae28-f20aca15af00/202207291846_fEEr_i.jpg',
      ),
      Restaurant(
        name: 'Billy The Grill - Boulevard Campos',
        category: 'Brasileira',
        deliveryTaxe: 'R\$ 7,99',
        distance: '2.5 km',
        rate: 4.5,
        time: [45, 50],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/8806e96e-6e18-43a0-ad89-2079d5245ef0/202106081056_LSEz_i.jpg',
      ),
      Restaurant(
        name: 'Divino Fogão - Campos Boulevard',
        category: 'Brasileira',
        deliveryTaxe: 'R\$ 7,99',
        distance: '1.2km',
        rate: 4.0,
        time: [62, 72],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/28fd6660-d811-4a8a-b131-7df5517bb01e/202006251624_iZqc_i.jpg',
      ),
      Restaurant(
        name: 'Salada Lovers',
        category: 'Saudável',
        deliveryTaxe: 'Grátis',
        distance: '2.3',
        rate: 4.7,
        time: [45, 60],
        favorite: false,
        photoUrl:
            'https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/201907270936_ded49992-f0b6-442e-b108-106285304e6d.png',
      ),
    ];
