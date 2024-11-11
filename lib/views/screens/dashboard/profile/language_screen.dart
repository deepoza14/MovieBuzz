import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_buzz/views/base/custom_image.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Language',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  path:
                      'https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/188px-Flag_of_England.svg.png',
                  height: 50,
                  width: 60,
                ),
                const SizedBox(width: 15),
                Text(
                  'English (UK)',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
