import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_buzz/views/base/common_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> pageContents = [
    'Discover the latest movies and trending blockbusters.',
    'Get detailed information about your favorite films.',
    'Enjoy movie recommendations and reviews, all in one place.',
  ];

  final List<Color> pageColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  void _onSkip() {
    _pageController.jumpToPage(pageContents.length - 1);
  }

  void _onContinue() {
    if (currentPage < pageContents.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      // Navigate to next screen or complete intro
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pageContents.length,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: pageColors[index],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Embrace Movie Details, Anytime Anywhere',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pageContents[index],
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pageContents.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: currentPage == dotIndex
                              ? Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 8,
                        width: currentPage == dotIndex ? 26 : 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [

              Expanded(
                child: CustomButton(type: ButtonType.secondary,
                  height: 50,
                  radius: 20,
                  onTap: _onSkip,
                  title: 'Skip',
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  height: 50,
                  radius: 20,
                  onTap: _onContinue,
                  title: currentPage == pageContents.length - 1
                      ? 'Get Started'
                      : 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
