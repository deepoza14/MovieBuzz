import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_buzz/services/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_buzz/views/base/common_button.dart';
import 'package:movies_buzz/views/base/custom_image.dart';

class TrendingNowScreen extends StatefulWidget {
  const TrendingNowScreen({super.key});

  @override
  State<TrendingNowScreen> createState() => _TrendingNowScreenState();
}

class _TrendingNowScreenState extends State<TrendingNowScreen> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 440,
            autoPlay: false,
            reverse: false,
            viewportFraction: 1,
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return CustomImage(
                    width: size.width,
                    fit: BoxFit.fill,
                    path:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUOpwFVoR5xgrQX0AqB__TnzrmPtDbk9l30LJt78ih0wvfo-CW');
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              alignment: AlignmentDirectional.bottomEnd,
              width: size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 40.0, left: 18, right: 18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        child: CustomButton(
                          color: secondaryColor,
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Favourite',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: CustomButton(
                          onTap: () {},
                          title: 'Details',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: _buildIndicator(5),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(int notificationBannerCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(notificationBannerCount, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          width: 7.5,
          height: 7.5,
          decoration: BoxDecoration(
            color: _currentPage == index ? primaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
