import 'package:flutter/material.dart';
import 'package:ifood_clone/components/header_local_component.dart';

import '../../core/theme/app_icons.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderLocationComponent(Location: "Rua das Flores do Campo, 10")
        ],
      ),
    );
  }
}
