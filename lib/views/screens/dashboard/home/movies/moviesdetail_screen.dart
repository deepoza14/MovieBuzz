import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            SizedBox(
              height: 100,
              width: size.width,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter, // Start at the top
                              end: Alignment.bottomCenter,
                              colors: [
                                primaryColor,
                                textSecondary,
                              ],
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Robert_Pattinson_Premiere_of_The_Lost_City_of_Z_at_Zoo_Palast_Berlinale_2017_02.jpg/255px-Robert_Pattinson_Premiere_of_The_Lost_City_of_Z_at_Zoo_Palast_Berlinale_2017_02.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            width: 54,
                            child: Text(
                              'Robert Pattinson',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    ),
                  );
                },
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
                    'Photos',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 110,
              width: size.width,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    height: 110,
                    width: 160,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, // Start at the top
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor,
                          textSecondary,
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://s3-alpha-sig.figma.com/img/a144/ad4a/82e186f5224a56491b766410a930c181?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=a-UYeTtuOC6FP47mJw~7IGXUitqeSr2uFMdS0qOVFuaBtMD1lcWgo~hoShiSzhLVQgwxfTV0OC7o5oAYY7T58WxHfBXvqYSosesFJo-4XB3D18ZPop~pTzqbOyKlRlI3q5n8PVp8cG2aFxQKMeL0HnvdWu6cICv~WqrPXfN2~Foi9Hz7qJKBvWgWqmxY~Mbe9WrKIl3Xos6KWCcOb3~CiJADCM6XMpqtMAunxFDw2gC7YYwZJLZuIWVye4nV-O9WAMEZjosvxryMmvfgP8Tbphiag~7PenrMLQFJ7zjK~jKR~S8dEMOB6-GPoqxtv1Ot-6ID8hB9IAeDe9MR-2lL5w__"),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
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
                    'Comments',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://s3-alpha-sig.figma.com/img/f43c/ed33/6de03a8c4db6bb1f4fcf4c5d27ee3e3e?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lzZ7oHkkW-h2ytNJKGU3Utj32YBuTaqPNjUdlzXJFy39N9s7AjBRCbbeDHR2LskrqDiFz~HhNxSrsdu2RW38yLwIHHsXnP5IMETXApxzfAEYkZDk3jnniJVrjTB8pLc~9elSd0r8dVscyNIQqtDkqQQCqyrfLtMl82ByGJ7rWICr~csrg8P0wQTKcL7hI29sZpPj2wXLs-7KEBEFJOzrzOaWnHExMEmguNI2hgsP3CGB0reKjaZ~L6IGr~i4EU2hkiKBYDgCoIvFHd0mLRz9g37TAobFVjzblIDpQW8N23VhSwiI4Ly68vOy1zRTejz2PF74CRCFHphfcMXCChCYCg__'),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dorine Viola',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingBarIndicator(
                                    rating: 3,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 10.0,
                                    // Size of each star
                                    direction: Axis.horizontal,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '2022/07/26',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '''Everything about this movie is trying too hard - the over dramatic score, the long shots on characters faces, the overacting, the complex crime story - it all feels like it's trying to get an Oscar in every moment.''',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
