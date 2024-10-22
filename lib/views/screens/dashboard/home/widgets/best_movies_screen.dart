import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_buzz/services/route_helper.dart';
import 'package:movies_buzz/services/theme.dart';
import 'package:movies_buzz/views/base/custom_image.dart';
import 'package:movies_buzz/views/screens/dashboard/home/movies/moviesdetail_screen.dart';

class BestMoviesScreen extends StatefulWidget {
  const BestMoviesScreen({super.key});

  @override
  State<BestMoviesScreen> createState() => _BestMoviesScreenState();
}

class _BestMoviesScreenState extends State<BestMoviesScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    'Best Movies',
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(),
                  )),
              Text(
                "See More",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: primaryColor),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 230, // Increased height to allow space for the heart icon
          width: size.width,
          padding: const EdgeInsets.only(left: 18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 18),
                // Padding between items
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, getCustomRoute(child: MoviesDetailScreen()));
                  },
                  child: Stack(
                    clipBehavior: Clip.none, // Allows child widgets to overflow
                    children: [
                      // The image container
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter, // Start at the top
                            end: Alignment.bottomCenter,
                            colors: [
                              primaryColor,
                              Colors.black,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomImage(
                          radius: 8,
                          fit: BoxFit.fill,
                          path:
                          'https://rukminim2.flixcart.com/image/850/1000/jfea93k0/poster/j/3/u/medium-the-avenges-initiative-3-moives-posters-mp0098-original-imaf3mhpcyhwhtkt.jpeg?q=90&crop=false',
                          width: 120,
                          height: 200, // Height of the image itself
                        ),
                      ),
                      // Positioned heart icon at the bottom center
                      Positioned(
                        bottom: 5, // Positioned inside the container slightly
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            // Space for the gradient border
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // Circular shape
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                  primaryColor, // Start color of the gradient
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
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
