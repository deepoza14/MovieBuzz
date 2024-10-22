import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth_repo.dart';
import '../../../services/extra_methods.dart';
import '../../../services/helper_widgets.dart';
import '../../../services/theme.dart';
import '../../base/custom_image.dart';
import '../../base/lottie_builder.dart';
import '../../base/read_more_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<int?> deleteNotificationId = [];
  bool select = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      await Get.find<AuthRepo>().saveUserNotificationTimeStamp(DateTime.now().toIso8601String());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: select
                    ? () async {
                        select = !select;
                        if (deleteNotificationId.isNotEmpty) {}
                      }
                    : () {
                        select = !select;

                        setState(() {});
                      },
                icon: select
                    ? const Icon(
                        Icons.delete,
                      )
                    : const Text('Select')),
          )
        ],
      ),
      body: Builder(builder: (notificationController) {
        if (false) {
          return const Center(child: CustomLottie(assetLottie: Assets.lottiesEmptynotification));
        }
        return RefreshIndicator(
          onRefresh: () async {},
          child: SafeArea(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                );
              },
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: select ? () {} : null,
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      // Handle dismissal here, e.g., remove item from the list
                      setState(() {
                        // notificationController.getNofification.removeAt(index);
                        // deleteNotificationId.add(notification.id!);
                      });
                    },
                    background: Container(
                      color: Colors.red, // Customize background color for dismiss
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      padding: const EdgeInsets.all(10),
                      // color: select
                      // ? notification.isSelected
                      //     ? primaryColor
                      //     : Colors.white
                      // :
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: primaryColor,
                                child: Text(
                                  "${1 + index}",
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Notification Title",
                                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    ReadMoreText(
                                      "Description",
                                      moreStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                                            color: Colors.blue,
                                          ),
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w300, fontSize: 10),
                                      lessStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                                            color: Colors.blue,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (false)
                                GestureDetector(
                                  onTap: () {
                                    ExtraMethods.launchInBrowser("");
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.ads_click,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        addVerticalSpace(5),
                                        Text(
                                          "Visit Link",
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          if (false) addVerticalSpace(15),
                          if (false)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Stack(
                                children: [
                                  CustomImage(
                                    viewFullScreen: true,
                                    path: Assets.imagesPlaceholder,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          color: Colors.black.withOpacity(0.5),
                                          child: Center(
                                              child: Text(
                                            "View Image",
                                            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                                          )),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
