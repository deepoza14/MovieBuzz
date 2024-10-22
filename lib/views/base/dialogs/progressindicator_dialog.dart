import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressIndicatorDialog extends StatefulWidget {
  const ProgressIndicatorDialog({super.key});

  @override
  ProgressIndicatorDialogState createState() => ProgressIndicatorDialogState();
}

class ProgressIndicatorDialogState extends State<ProgressIndicatorDialog> {
  @override
  void initState() {
    super.initState();
    log("dialogue run");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

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
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(60),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}

class Constants {
  Constants._();

  static const double padding = 20;
  static const double avatarRadius = 45;
}
