import 'package:flutter/material.dart';
import 'package:movies_buzz/services/extensions.dart';

import '../../../generated/assets.dart';
import '../../../services/helper_widgets.dart';
import '../common_button.dart';
import '../lottie_builder.dart';

void showPaymentFailedDialog(BuildContext context, String? message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CustomLottie(
                assetLottie: Assets.lottiesPaymentfailed,
              ),
              Text(
                "$message".capitalizeFirstOfEach,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
              ),
              addVerticalSpace(15),
              CustomButton(
                radius: 10,
                onTap: () {
                  Navigator.pop(context);
                },
                title: "OK",
              ),
            ],
          ),
        ),
      );
    },
  );
}
