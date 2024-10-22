import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../main.dart';
import '../../../services/helper_widgets.dart';
import '../../../services/route_helper.dart';
import '../common_button.dart';

class PaymentSuccessfullDialog extends StatefulWidget {
  final String message;

  const PaymentSuccessfullDialog({
    super.key,
    required this.message,
  });

  @override
  PaymentSuccessfullDialogState createState() => PaymentSuccessfullDialogState();
}

class PaymentSuccessfullDialogState extends State<PaymentSuccessfullDialog> {
  @override
  void initState() {
    super.initState();
    log("dialogue run${DateTime.now()}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Return true to allow popping the page.
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
              addVerticalSpace(5),
              const Center(
                child: Text(
                  'Purchase Successful',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              addVerticalSpace(15),
              Center(
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF46454A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                elevation: 0,
                radius: 4,
                onTap: () {
                  Navigator.pop(context);
                },
                title: "Okay",
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                child: const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                )),
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
