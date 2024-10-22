import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/theme.dart';
import '../common_button.dart';

class LeaveAppDialog extends StatelessWidget {
  const LeaveAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      // title: true ? null : Padding(
      //     padding: const EdgeInsets.only(top:40.0),
      //     child: CustomAssetImage(path: Assets.imagesLogo,height: 60,)
      // ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Oh no! You're leaving...\nAre you sure?",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "This action cannot be undone",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 13.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                color: primaryColor,
                radius: 6,
                type: ButtonType.primary,
                // title: 'Naah, Not right now',
                height: 46,
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.close_rounded,
                      size: 22,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Naah, Not right now",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                radius: 6,
                type: ButtonType.secondary,
                // title: 'Yes, I am closing',
                height: 46,
                onTap: () {
                  // Get.find<AuthController>().clearSharedData();
                  Navigator.pop(context, true);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 22,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Yes, I am closing",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: primaryColor,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
