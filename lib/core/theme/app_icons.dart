import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String pathIcons = 'assets/icons/';

class AppIcons {
  static const arrowDown = '${pathIcons}arrow_down.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;

  const AppIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}
