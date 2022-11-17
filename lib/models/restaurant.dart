// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String category;
  final String deliveryTaxe;
  final String distance;
  final double rate;
  final List<int> time;
  final bool favorite;
  final String photoUrl;

  Restaurant(
      {required String this.name,
      required String this.category,
      required String this.deliveryTaxe,
      required String this.distance,
      required double this.rate,
      required List<int> this.time,
      required bool this.favorite,
      required String this.photoUrl});

  Restaurant changeFav({
    bool? favorite,
  }) {
    return Restaurant(
      name: this.name,
      category: this.category,
      deliveryTaxe: this.deliveryTaxe,
      distance: this.distance,
      rate: this.rate,
      time: this.time,
      favorite: favorite ?? this.favorite,
      photoUrl: this.photoUrl,
    );
  }
}
