import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';

class BannersComponenet extends StatefulWidget {
  const BannersComponenet({super.key, required this.banners});
  final List<BannerItemComponent> banners;

  @override
  State<BannersComponenet> createState() => _BannersComponenetState();
}

class _BannersComponenetState extends State<BannersComponenet> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      print(_pageController.toString());
      _onChangepage;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.removeListener(() {
      _onChangepage;
    });
  }

  _onChangepage(int page) {
    setState(() {
      _currentIndex = _pageController.page!.round();
      print(_currentIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: widget.banners,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners
                  .map((e) => Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 200),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.banners.indexOf(e) == _currentIndex
                                ? AppColors.grey70
                                : AppColors.grey30,
                          ),
                          width: 4,
                          height: 4,
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class BannerItemComponent extends StatelessWidget {
  const BannerItemComponent({super.key, required this.imagepath});

  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagepath,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
