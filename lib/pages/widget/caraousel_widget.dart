import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';

class MyCarousel extends StatefulWidget {
  final List<Widget> items;
  final bool autoPlay;
  const MyCarousel({
    Key? key,
    required this.items,
    this.autoPlay = false,
  }) : super(key: key);

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    if (widget.autoPlay) {
      _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
        if (_currentPage < widget.items.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      _timer = Timer(const Duration(seconds: 0), () {});
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return (widget.items[index]);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        DotIndicator(
          len: widget.items.length,
          curentPage: _currentPage,
          activeColor: orangeColor,
          normalColor: greyColor,
          size: 12,
        ),
      ],
    );
  }
}

//build dot incator page carousel
class DotIndicator extends StatelessWidget {
  final int len;
  final int curentPage;
  final double size;
  final double marginTop;
  final Color activeColor;
  final Color normalColor;
  const DotIndicator({
    Key? key,
    required this.len,
    required this.curentPage,
    this.size = 10,
    this.marginTop = 10,
    this.activeColor = Colors.blue,
    this.normalColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(len, (index) {
        return Container(
          width: size,
          height: size,
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: marginTop,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: curentPage == index ? activeColor : normalColor,
          ),
        );
      }),
    );
  }
}
