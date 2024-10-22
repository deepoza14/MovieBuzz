import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/auth_controller.dart';
import '../../../services/theme.dart';
import '../common_button.dart';
import '../custom_image.dart';

class LogOut {
  dialogue(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const LogoutDialog();
      },
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor,
                  )),
              child: Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.red.withOpacity(0.8), BlendMode.srcATop),
                  child: const CustomImage(
                    path: Assets.imagesExclaim,
                    color: Colors.white,
                    height: 40,
                  ),
                ),
              ),
            ),
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
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                color: primaryColor,
                radius: 6,
                type: ButtonType.primary,
                title: 'Naah, Just Kidding',
                height: 46,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                radius: 6,
                type: ButtonType.secondary,
                title: 'Yes, Log Me Out',
                height: 46,
                onTap: () {
                  Get.find<AuthController>().clearSharedData();

                  // Navigator.pop(context);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const BottomNavigation(),
                  //     ),
                  //     (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
