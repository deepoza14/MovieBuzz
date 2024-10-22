import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../services/route_helper.dart';
import '../../base/common_button.dart';
import '../../base/custom_image.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  LoginDialogState createState() => LoginDialogState();
}

class LoginDialogState extends State<LoginDialog> {
  @override
  void initState() {
    super.initState();
    log("dialogue run");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Return false if showDialog() returned null
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: Constants.padding, top: Constants.avatarRadius + 10, right: Constants.padding, bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 5), blurRadius: 5),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5),
              Center(
                child: Text(
                  'You are not login'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF263238),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  '''Unlocking possibilities: Login required for a world of personalized experiences.''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF46454A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      type: ButtonType.secondary,
                      elevation: 0,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: "CANCEL",
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      elevation: 0,
                      onTap: () {
                        // Navigator.push(context, getCustomRoute(child: const MobileAuth()));
                      },
                      title: "LOGIN",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: -5,
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: ClipRRect(borderRadius: BorderRadius.circular(50), child: const CustomImage(path: Assets.iconsPassword)),
          ),
        ),
      ],
    );
  }
}

class Constants {
  Constants._();

  static const double padding = 20;
  static const double avatarRadius = 45;
}
