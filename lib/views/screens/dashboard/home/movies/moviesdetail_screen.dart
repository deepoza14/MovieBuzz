import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_buzz/services/theme.dart';
import 'package:movies_buzz/views/base/custom_image.dart';
import 'package:movies_buzz/views/base/read_more_text.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            // Semi-transparent black
                            // borderRadius: BorderRadius.circular(20),
                            // border: Border.all(
                            //   color: Colors.white.withOpacity(0.3),
                            //   width: 1,
                            // ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    color: Colors.yellow,
                                    child: Text(
                                      "IMDB 8.0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
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
                                            .copyWith(
                                                color: Colors.yellowAccent),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '(551k reviews)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'The Batman',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      '2022',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      '2h 58 m',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    'Action',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: primaryColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Crime',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Icon(Icons.star),
                    Text(
                      'Rate',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.add),
                    Text(
                      'Add to List',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.share),
                    Text(
                      'Share',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
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
                    'Storyline',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReadMoreText(
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: primaryColor),
                lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: primaryColor),
                preDataTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                postDataTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                '''When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement ''',
              ),
            ),
            const SizedBox(height: 15),
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
                    'Top Casts',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}
