import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_buzz/services/extensions.dart';
import 'package:movies_buzz/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:movies_buzz/views/screens/dashboard/favourite/favourite_screen.dart';
import 'package:movies_buzz/views/screens/dashboard/profile/profile_screen.dart';
import 'package:movies_buzz/views/screens/dashboard/search/search_screen.dart';

import '../../../controllers/auth_controller.dart';
import '../../../generated/assets.dart';
import '../../../services/theme.dart';
import '../../base/dialogs/exit_dialog.dart';
import 'home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int selectPageIndex;

  const DashboardScreen({
    super.key,
    this.selectPageIndex = 0,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      pageIndex = widget.selectPageIndex;
    });
    Timer.run(() async {});
  }

  _pageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (Get.find<AuthController>().drawercheck) {
          Navigator.of(context).pop();
          return false;
        } else if (pageIndex != 0) {
          pageIndex = 0;
          setState(() {});
          return false; // Do not allow back navigation.
        } else {
          bool? shouldPop = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ExitDialog();
            },
          );
          return shouldPop ??
              false; // Return false if showDialog() returned null
        }
      },
      child: Scaffold(
        body: [
          const HomeScreen(),
          const SearchScreen(),
          const FavouriteScreen(),
          const ProfileScreen(),
        ][pageIndex],
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            // home ---
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.24),
                  offset: const Offset(0, -4),
                  blurRadius: 4,
                )
              ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonTile(
                    title: 'Dashboard',
                    onClick: () {
                      _pageIndex(0);
                    },
                    icon: pageIndex == 0
                        ? Icon(IconlyBold.home, color: primaryColor, size: 20)
                        : const Icon(
                            IconlyLight.home,
                            size: 20,
                            color: Color(0xFFBEC2C4),
                          ),
                  ),
                  ButtonTile(
                    title: 'Search',
                    onClick: () {
                      _pageIndex(1);
                    },
                    icon: pageIndex == 1
                        ? Icon(IconlyBold.search, color: primaryColor, size: 20)
                        : const Icon(
                            IconlyLight.search,
                            size: 20,
                            color: Color(0xFFBEC2C4),
                          ),
                  ),
                  ButtonTile(
                    title: 'Favourite',
                    onClick: () {
                      _pageIndex(2);
                    },
                    icon: pageIndex == 2
                        ? Icon(IconlyBold.heart, color: primaryColor, size: 20)
                        : const Icon(
                            IconlyLight.heart,
                            size: 20,
                            color: Color(0xFFBEC2C4),
                          ),
                  ),
                  ButtonTile(
                    title: 'Profile',
                    onClick: () {
                      _pageIndex(3);
                    },
                    icon: pageIndex == 3
                        ? Icon(IconlyBold.profile,
                            color: primaryColor, size: 20)
                        : const Icon(
                            IconlyLight.profile,
                            size: 20,
                            color: Color(0xFFBEC2C4),
                          ),
                  ),
                ],
              ),
            ),
            // ---
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 12,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           // if (Get.find<AuthController>().getUserToken().isValid) {
            //           //   Navigator.push(
            //           //     context,
            //           //     getCustomRoute(
            //           //       duration: const Duration(milliseconds: 600),
            //           //       type: PageTransitionType.bottomToTop,
            //           //       child: const MyCartScreen(),
            //           //     ),
            //           //   );
            //           // } else {
            //           //   showDialog(
            //           //     context: navigatorKey.currentContext!,
            //           //     builder: (BuildContext context) {
            //           //       return const LoginDialog();
            //           //     },
            //           //   );
            //           // }
            //         },
            //         child: Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 10),
            //             padding: const EdgeInsets.all(
            //               14,
            //             ),
            //             decoration: BoxDecoration(
            //                 color: primaryColor,
            //                 shape: BoxShape.circle,
            //                 border: Border.all(
            //                   width: 4,
            //                   color: Colors.white,
            //                 ),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.black.withOpacity(0.25),
            //                     offset: const Offset(0, -4),
            //                     blurRadius: 4,
            //                   )
            //                 ]),
            //             child: Icon(Icons.shopping_cart)),
            //       ),
            //       const SizedBox(
            //         height: 2,
            //       ),
            //       Text(
            //         "My Cart",
            //         style: Theme.of(context).textTheme.labelSmall,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ButtonTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function() onClick;

  const ButtonTile(
      {super.key,
      required this.title,
      required this.onClick,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
