import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../services/route_helper.dart';
import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';
import '../home/movies/moviesdetail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  color: primaryColor,
                  width: 2,
                ),
                const SizedBox(width: 15),
                Text(
                  'Popular Searches',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 20.0, // Spacing between rows
                childAspectRatio: .6, // Aspect ratio of each item
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, getCustomRoute(child: MoviesDetailScreen()));
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    // Allows child widgets to overflow
                    children: [
                      // The image container
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            // Start at the top
                            end: Alignment.bottomCenter,
                            colors: [
                              primaryColor,
                              Colors.black,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CustomImage(
                          radius: 16,
                          fit: BoxFit.fill,
                          path:
                              'https://s3-alpha-sig.figma.com/img/bec1/a2a4/a37b0dc9a5ea2592b18067249a266bea?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lVYu8adAXB2exZ9GAEcJRX4A6of8yhqs6iNv8TgnlnnDeLP0Yd~FWk619tT9Gil-xWGma2Gg1d4gyxawTe7eb9jxqul~PE2~r0ygRfIpAQ8rxTQbtyw4R8~t3xALuFRyJoGcjyd7joTSThC1j8I953GJuNBLGbZ9Fyp1SSA7WosqfXw6iLyWa7K1kIjLl04x21NGOlwCkgY3IZY1lm503IZL9bjxGY0ZIlI~Pd~eLKSmyKuT-A-luPoh3aizmfwHDG1CoNS8jQEF-cKGlGVH5t2YwZpJnoEUvxDCVS0pRIxZDho4N9IOhNx1KEQcdk~ilFpzs5s3-fFU6NiQDrVABg__',
                          width: 120,
                          height: 180, // Height of the image itself
                        ),
                      ),
                      // Positioned heart icon at the bottom center
                      Positioned(
                        bottom: -10,
                        // Positioned inside the container slightly
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            // Space for the gradient border
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // Circular shape
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                  primaryColor,
                                  // Start color of the gradient
                                ],
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              // Inner padding for the icon
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // Inner circle with solid color
                                color: Colors
                                    .black, // Solid background color (black)
                              ),
                              child: Icon(
                                IconlyBold.heart, // Heart icon
                                color: primaryColor,
                                // Icon color (orange to match your design)
                                size: 24, // Icon size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      )),
    );
  }
}
