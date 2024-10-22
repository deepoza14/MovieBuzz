import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_buzz/views/base/custom_image.dart';

class MoviesDetailScreen extends StatefulWidget {
  const MoviesDetailScreen({super.key});

  @override
  State<MoviesDetailScreen> createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomImage(
                fit: BoxFit.fill,
                width: size.width,
                height: 600,
                path:
                    'https://rukminim2.flixcart.com/image/850/1000/jfea93k0/poster/j/3/u/medium-the-avenges-initiative-3-moives-posters-mp0098-original-imaf3mhpcyhwhtkt.jpeg?q=90&crop=false',
              ),
              Positioned(
                bottom: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                        width: size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          // Semi-transparent black
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(
                          //   color: Colors.white.withOpacity(0.3),
                          //   width: 1,
                          // ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  color: Colors.yellow,
                                  child: Text(
                                    "IMDB 8.0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  '8.9',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.yellowAccent),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '(551k reviews)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'The Batman',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
